-- Run inside real Aseprite in an isolated temporary profile; see README.
assert(not app.isUIAvailable, "Run this verification with --batch")
local root = assert(app.params.source, "--script-param source=<extension directory>")
local commands = {}
dofile(root .. "/main.lua")
init({ newCommand = function(_, spec) commands[spec.id] = spec end })

local count = 0
local function expect(condition, message)
  assert(condition, message)
  count = count + 1
end
local function near(actual, expected, message)
  expect(math.abs(actual - expected) < 0.00001, message .. ": " .. actual)
end
local function run(suffix)
  commands["AcademyColor" .. suffix].onclick()
end

for _, spec in pairs(commands) do
  expect(not spec.onenabled(), "Disabled without an active sprite")
  spec.onclick()
end

local sprite = Sprite(8, 8, ColorMode.RGB)
app.tool = "pencil"
app.bgColor = Color{ r=10, g=20, b=30, a=123 }
local image = sprite.cels[1].image
image:drawPixel(2, 3, app.pixelColor.rgba(30, 60, 90, 200))
local original = image:clone()
local palette = Palette(sprite.palettes[1])
local background = app.bgColor.rgbaPixel

for _, spec in pairs(commands) do
  expect(spec.onenabled(), "Enabled for RGB")
end
app.fgColor = Color{ h=210, s=0.6, v=0.6, a=137 }
run("ValueUp")
near(app.fgColor.hsvValue, 0.65, "Value increases by five percentage points")
near(app.fgColor.hsvSaturation, 0.6, "Value preserves saturation")
near(app.fgColor.hsvHue, 210, "Value preserves hue")
run("ValueDown")
near(app.fgColor.hsvValue, 0.6, "Value round trip")
run("SaturationDown")
near(app.fgColor.hsvSaturation, 0.55, "Saturation decreases")
run("SaturationUp")
near(app.fgColor.hsvSaturation, 0.6, "Saturation round trip")
run("HueUp")
near(app.fgColor.hsvHue, 215, "Hue increases")
run("HueDown")
near(app.fgColor.hsvHue, 210, "Hue round trip")
expect(app.fgColor.alpha == 137, "Partial alpha preserved")

app.fgColor = Color{ h=358, s=0.98, v=0.98, a=0 }
run("HueUp")
near(app.fgColor.hsvHue, 3, "Hue wraps above 360")
run("HueDown")
near(app.fgColor.hsvHue, 358, "Hue wraps below zero")
run("SaturationUp")
run("ValueUp")
near(app.fgColor.hsvSaturation, 1, "Saturation clamps at one")
near(app.fgColor.hsvValue, 1, "Value clamps at one")
expect(app.fgColor.alpha == 0, "Transparent foreground remains transparent")
for _ = 1, 25 do run("SaturationDown"); run("ValueDown") end
near(app.fgColor.hsvSaturation, 0, "Saturation clamps at zero")
near(app.fgColor.hsvValue, 0, "Value clamps at zero")
-- HSV storage must keep a useful hue through black/gray.
run("ValueUp")
run("SaturationUp")
near(app.fgColor.hsvHue, 358, "Hue survives black and gray")

expect(app.tool.id == "pencil", "Tool preserved")
expect(app.bgColor.rgbaPixel == background, "Background color preserved")
for y = 0, 7 do
  for x = 0, 7 do
    expect(image:getPixel(x, y) == original:getPixel(x, y), "Canvas preserved")
  end
end
expect(#sprite.palettes[1] == #palette, "Palette size preserved")
for i = 0, #palette - 1 do
  expect(sprite.palettes[1]:getColor(i).rgbaPixel == palette:getColor(i).rgbaPixel,
    "Palette colors preserved")
end

for _, mode in ipairs({ ColorMode.INDEXED, ColorMode.GRAY }) do
  local other = Sprite(8, 8, mode)
  local before = app.fgColor.rgbaPixel
  for _, spec in pairs(commands) do
    expect(not spec.onenabled(), "Disabled outside RGB")
    spec.onclick()
    expect(app.fgColor.rgbaPixel == before, "Unsupported mode is a no-op")
  end
  other:close()
end
sprite:close()
print("Academy Color Keys: " .. count .. " assertions passed in Aseprite " .. tostring(app.version))
