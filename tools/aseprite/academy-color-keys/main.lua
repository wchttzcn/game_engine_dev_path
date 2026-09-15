-- Foreground color only: no canvas, palette, tool or shortcut changes.
local function enabled()
  return app.sprite ~= nil and app.sprite.colorMode == ColorMode.RGB
end

local function adjust(component, amount)
  if not enabled() then return end
  local current = app.fgColor
  local hsv = {
    h = current.hsvHue,
    s = current.hsvSaturation,
    v = current.hsvValue,
    a = current.alpha,
  }
  if component == "h" then
    hsv.h = (hsv.h + amount) % 360
  else
    hsv[component] = math.max(0, math.min(1, hsv[component] + amount))
  end
  app.fgColor = Color(hsv)
end

function init(plugin)
  local commands = {
    { "ValueUp", "Value +", "v", 0.05 },
    { "ValueDown", "Value -", "v", -0.05 },
    { "SaturationDown", "Saturation -", "s", -0.05 },
    { "SaturationUp", "Saturation +", "s", 0.05 },
    { "HueDown", "Hue -", "h", -5 },
    { "HueUp", "Hue +", "h", 5 },
  }
  for _, spec in ipairs(commands) do
    local component, amount = spec[3], spec[4]
    plugin:newCommand {
      id = "AcademyColor" .. spec[1],
      title = "Academy Color: " .. spec[2],
      group = "file_scripts",
      onenabled = enabled,
      onclick = function() adjust(component, amount) end,
    }
  end
end

function exit(plugin)
end
