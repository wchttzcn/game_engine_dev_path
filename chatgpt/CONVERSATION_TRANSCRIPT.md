# Conversation Transcript

> This transcript captures the substantive project conversation that established the current direction. It includes both user messages and assistant responses so another agent can recover not only facts but also tone and reasoning style.

---

## User

Şimdi benim adım Mücahit ve 5-6 yıldır yazılımcılık yapıyorum bu yazılımcılık dediğimiz şey React ve Vue frameworkleri ile Backoffice uygulamaları geliştirmek, Typescript ve JavaScript oldukça iyi biliyorum tabii bir kaç backend Go, C# deneyimim oldu öğrenme adına ama artık çok fazla güncel değilim ve şu an da React Lead görevinde iş yapıyorum, artık her zaman öğrenmek istediğim şeyi yapmak istiyorum Low level programming tabii bunu da oyun yaparak öğrenmek istiyorum bir çok oyun oynadığımı söyleyebilirim ve şu anda takip ettiğim Programlama dilleri Odin ve Jai ama henüz Jai çıkmadı bu nedenle Odin odaklı gitmek istiyorum Odinde basit syntaxleri tabii ki biliyorum farklı bir şey değil şimdi benim istediğim şey şu aynı Boot.dev gibi bir platform ama bana özgü olmalı ve Game Engine Developer yapmalı beni enine boyuna öğretmeli tabii ki bu oyun odaklı olmalı yani ilk yapacağım oyun Pong, Snake olabilir ama oyunlar üstüne koymalı ve Juice öğretmeli ben sana bir kaç beğendiğim oyunu söylemek istiyorum ve sende buna göre detaylandır istiyorum beraber planlayalım projenin nasıl olacağını

---

## Assistant

Mücahit, bu hedefi çok net ayırabiliriz: **“Odin öğrenmek” değil, Odin kullanarak low-level programlama + game programming + engine architecture öğrenmek.** Senin mevcut seviyende `for`, `if`, struct, function gibi konulara haftalar harcamak zaman kaybı olur. Asıl geçiş yapman gereken yer TypeScript dünyasından **memory layout, allocation, pointers, CPU/cache, frame lifecycle, rendering, asset management, debugging/profiling ve data-oriented design** dünyasına geçmek.

Ben bu projeyi aşağıdaki gibi düşünürdüm.

## Ana hedef: Game Engine Developer Path

Sonunda senden şunu beklemek istiyorum:

> Boş bir Odin projesi açıp bir oyun yapabilirsin.  
> Oyunun ihtiyaçlarından reusable engine sistemleri çıkarabilirsin.  
> Renderer'ın, allocator'ın, ECS'nin, asset pipeline'ın veya physics sisteminin *neden* o şekilde tasarlandığını açıklayabilirsin.  
> Gerektiğinde framework'ü bırakıp OS / graphics API seviyesine inmekten korkmazsın.

Yani sonuçta sadece "Odin ile oyun yapan biri" değil, **engine programmer zihniyetine sahip biri** olmalısın.

Ve bunun için önemli bir kuralımız olacak:

> **Engine yaparak oyun öğrenmeyeceğiz. Oyun yaparak engine öğreneceğiz.**

İlk günden `engine/renderer`, `engine/ecs`, `engine/audio`, `engine/physics` diye 40 klasör açmayacağız. Bir sistemi iki-üç oyunda tekrar tekrar ihtiyaç duyduğunda onu engine'e çıkaracağız.

Bu çok önemli.

## Boot.dev tarafını nasıl kopyalayacağız?

Her konu aynı öğrenme döngüsünden geçecek:

**Concept → Micro Challenge → Game Feature → Juice Challenge → Engine Extraction → Boss Fight → Postmortem**

Örneğin sana "vector nedir" diye 20 dakika teori anlatmayacağım.

Önce `Vec2` ile ilgili küçük problemler çözeceksin.

Sonra Pong topunun velocity'sini kullanacaksın.

Sonra Asteroids'te rotation + acceleration + normalization göreceksin.

Sonra homing missile yapacaksın.

Sonunda kendi math katmanında hangi operasyonlara gerçekten ihtiyacın olduğunu anlayacaksın.

Bu şekilde bilgi **oyun mekaniğine bağlanacak.**

Boot.dev benzeri challenge sistemi de olabilir:

```text
CHALLENGE
─────────

Topun hızını frame rate'den bağımsız hale getir.

Constraint:
- Global değişken kullanma
- raylib GetFrameTime dışında helper kullanma
- Ball.update() yazma

Acceptance:
✓ 30 FPS'te aynı hız
✓ 60 FPS'te aynı hız
✓ 144 FPS'te aynı hız

Bonus:
Fixed timestep kullan.

Engine Question:
Variable timestep neden physics için problem olabilir?
```

Ben sana doğrudan çözümü vermek yerine gerektiğinde **Hint 1 → Hint 2 → Hint 3 → çözüm analizi** şeklinde ilerletebilirim.

## Curriculum omurgası

Şimdilik oyun isimlerini kesinleştirmeden şöyle bir progression düşünüyorum:

| Aşama | Proje | Ana konu | Engine kazanımı |
|---|---|---|---|
| 0 | Odin Systems Playground | memory, pointer, layout, allocator | Low-level temel |
| 1 | Pong | game loop, input, delta time, collision | Core loop |
| 2 | Snake | grid, contiguous memory, state | Data structures |
| 3 | Breakout | collision response, entities | Entity lifecycle |
| 4 | Asteroids | vectors, transforms, pooling | Math + object management |
| 5 | Juice Arena | particles, shake, hitstop, tween | Game feel toolkit |
| 6 | Platformer | tilemap, physics, camera | 2D world |
| 7 | Action/Roguelite | abilities, ECS/DOD, spawning | Gameplay architecture |
| 8 | Small Engine Editor | assets, serialization, debug tools | Tooling |
| 9 | 3D Game | matrices, camera, mesh, shader | Renderer fundamentals |
| 10 | Custom Renderer | GPU buffers, batching, shaders | Graphics programming |
| 11 | Engine Capstone | kendi oyunlarından türetilmiş engine | Engine architecture |
| 12 | Final Game | seçtiğin tür | Production |

Ama burada çok önemli bir şey var: **Pong → Snake → Breakout diye tutorial checklist yapmayacağız.**

Her oyun öncekinin üzerine bir kavram ekleyecek.

Mesela Pong'da basit:

```text
position += velocity * dt
```

ile başlarız.

Asteroids'e geldiğimizde:

```text
velocity += acceleration * dt
position += velocity * dt
```

Platformer'da collision resolution eklenir.

Daha sonra fixed timestep gelir.

Daha sonra interpolation.

Sonra broad phase.

Sonra spatial partitioning.

Böylece physics bir anda "Physics Engine Bölüm 17" olarak karşına çıkmaz.

**Yavaş yavaş doğar.**

## Juice ayrı bir ders olmayacak

Burada özellikle söylediğin **Juice** kısmını çok önemsiyorum.

Çoğu game programming curriculum'unda oyun teknik olarak bittikten sonra:

> "İstersen particle ekleyebilirsin."

deniliyor.

Bizde tam tersi olacak.

Örneğin Pong'un bile üç versiyonu olacak:

**Pong v0 — It Works**

Top gidiyor, paddle hareket ediyor, skor var.

**Pong v1 — It Feels Good**

Ball trail, impact particles, pitch-shifted sound, squash/stretch, score animation, screenshake, paddle recoil.

**Pong v2 — Engine Thinking**

Juice sistemlerini tekrar kullanılabilir hale getiriyoruz.

Örneğin zamanla:

```text
trauma.add(...)
camera_shake.update(...)
particles.emit(...)
tween.start(...)
hitstop.trigger(...)
audio.play_variation(...)
```

gibi sistemler ortaya çıkacak.

Ama bunları Pong'dan önce tasarlamayacağız.

**İhtiyaç doğdukça yazacağız.**

Bu sayede "game feel" senin engine architecture'ının bir parçası olacak.

## Low-level tarafını da oyunların içine gömeceğiz

Burada senin geçmişine özel ciddi bir avantajımız var.

Syntax öğretimine fazla zaman ayırmamıza gerek yok.

Onun yerine JavaScript/TypeScript'te çoğunlukla görünmeyen şeylere saldırabiliriz.

Örneğin Snake'te sadece Snake yapmayacağız.

Array-of-Structs ile Struct-of-Arrays farkına bakacağız.

Memory layout çıkaracağız.

`size_of` ve alignment inceleyeceğiz.

Heap allocation yapmadan Snake yazmayı deneyeceğiz.

Sonra CPU açısından:

```text
neden contiguous memory iyi?
pointer chasing nedir?
cache line nedir?
branch prediction neden önemli?
```

gibi konuları gerçek kod üzerinden göreceğiz.

Asteroids'e geldiğimiz zaman örneğin:

```text
10 asteroid
100 asteroid
10.000 asteroid
100.000 asteroid
```

spawn edip profiler'a bakabiliriz.

Sonra:

```text
Entity {
    position
    velocity
    sprite
    health
}
```

gibi klasik OOP-ish yaklaşım ile data-oriented yaklaşımı karşılaştırabiliriz.

Bu noktada ECS konuşmak anlamlı hale gelir.

**İlk derste ECS anlatmak istemiyorum.**

Çünkü ECS'nin çözdüğü problemi yaşamadan ECS öğrenmek ezber oluyor.

## Renderer yolumuz da kademeli olacak

İlk birkaç oyunda raylib kullanmamız bence doğru.

Ama raylib bizim engine'imiz olmayacak.

Başlangıçta kabaca:

```text
Our Game
   ↓
Our Code
   ↓
raylib
   ↓
OS / GPU
```

olacak.

Daha sonra:

```text
Our Game
   ↓
Our Engine
   ↓
Our Renderer
   ↓
OpenGL / D3D / Metal
```

seviyesine ineceğiz.

Hatta çok daha ileride istersek platform katmanını da inceleyebiliriz:

```text
Win32
X11 / Wayland
Cocoa
```

Ama **Pong yaparken Win32 window creation öğrenmenin hiçbir faydası yok.**

Önce oyun programcısı olacağız.

Sonra systems programmer.

Sonra renderer programmer.

Sonra bunları birleştirip engine programmer olacağız.

## Matematiği de farklı öğreteceğiz

"Şimdi linear algebra öğren, sonra oyun yaparsın" yaklaşımına karşıyım.

Matematiği ihtiyaç geldiğinde öğreneceğiz.

Pong:

```text
position
velocity
reflection
```

Asteroids:

```text
vector
normalize
dot product
rotation
```

Platformer:

```text
AABB
projection
intersection
```

2D lighting:

```text
normal
ray
intersection
```

3D:

```text
matrix
basis
projection
view matrix
quaternion
```

Sonra shader programming ile matematik tekrar karşına çıkacak.

Böyle olunca `dot(a,b)` ezberlediğin bir fonksiyon değil, **oyun yaparken ihtiyacın olan bir araç** oluyor.

## Boss Fight sistemi

Bir bölüm sonunda tutorial vermeyeceğim.

Mesela:

> **Boss Fight: Breakout++**
>
> Sana sadece requirements veriyorum.
>
> Multi-ball olacak.  
> Power-up olacak.  
> Particle olacak.  
> Screen shake olacak.  
> Level loading olacak.  
> Pause olacak.
>
> Mimari sana ait.

Ben kod yazmadan önce architecture review yapabilirim.

Sonrasında kodunu inceleyip:

```text
Correctness
Memory
Architecture
Performance
API Design
Game Feel
Debuggability
```

açısından değerlendirebilirim.

Böylece senior frontend geçmişindeki code-review kültürünü engine development'a taşıyabiliriz.

## Engine Journal

Her büyük projeden sonra küçük bir teknik postmortem yazmanı isterim.

Örneğin:

> Breakout bittikten sonra entity sistemimde ne kötüydü?
>
> Allocation nerede yaptım?
>
> Frame başına kaç allocation var?
>
> Hangi abstraction erken yapıldı?
>
> Hangi abstraction eksik?
>
> Bir sonraki oyunda neyi değiştireceğim?

Altı ay sonra dönüp baktığında engine'in evrimini göreceksin.

Bu kısım seni sadece "kod yazan" değil, **engine tasarlayabilen** biri yapacak.

## Oyun tercihlerine göre devam

Curriculum'un ikinci yarısını generic yapmak istemiyorum. **Senin sevdiğin oyunların DNA'sından üretelim.**

Bana mümkünse **5–10 oyun** söyle. AAA, indie, eski, yeni fark etmez. Yanlarına neden sevdiğini de tek kelimeyle bile yazabilirsin.

---

## User

Dead Cells — movement/combat, Braid, Anniversary Edition - rewind stuff,  BOKURA - co-op olması ve aynı evrende iki farklı sprite olması ve bir karakter bunu hayvan olarak görürken diğeri robotlar görmesi  ve birbirleri arasında platfrom çözmeleri, Baba Is You - inanılmaz zekice sokoban her şeyin her şey olabilmesi hoşuma gitti, We Were Here (serisi) - buradaki olayda yine co-op oynama birisi cevapları görüyorken diğerine söyelip kapıları beraber açma olayı, Storyteller - olayların dinamikliği ve akıcılığı, PICO PARK - co-op olarak oynan başka oyun eğlenceli ve beceri isteyen basit bir oyun.

---

## Assistant

Bu oyunları görünce curriculum’un yönü çok daha netleşti. Senin ilgini çeken şey aslında “oyun yapmak”tan biraz daha spesifik: **mekaniklerin sistem olarak birbirine bağlanması**. Dead Cells’te kontrol hissi, Braid’de zamanın oyun state’inin parçası olması, Baba Is You’da kuralların data’ya dönüşmesi, BOKURA ve We Were Here’da oyuncuların aynı gerçekliğin farklı parçalarını görmesi, Storyteller’da olayların kombinatoryal şekilde tepki vermesi… Bunların hepsinin ortak noktası şu: **oyun mekaniği hard-coded script olmaktan çıkıp engine’in işleyebildiği bir sisteme dönüşüyor.**

Bence senin kişisel yol haritanın omurgası tam olarak bunun üzerine kurulmalı.

## Senin Game Engine Developer profilin

Seni klasik “graphics programmer” rotasına sokmak istemiyorum. Renderer kesinlikle öğreneceğiz, fakat hedefin yalnızca Vulkan açıp triangle çizmek değil.

Senin rotan daha çok şu dört şeyin kesişimi:

**Systems Programming + Gameplay Systems + Engine Architecture + Game Feel**

Buna daha sonra networking ve rendering ekleyeceğiz.

Yani birkaç sene sonra en ilginç bulmanı beklediğim problem muhtemelen şuna benzeyecek:

```text
"Bir co-op puzzle oyununda iki oyuncu aynı entity'yi
farklı representation'larla görürken,
rewind edilebilir world-state,
deterministic simulation ve rule-based interactions
nasıl tasarlanır?"
```

Bu, senin sevdiğin oyunların neredeyse tamamının kesişimi.

Ve inanılmaz iyi bir engine-programming problemi.

## Curriculum'un ana skill tree'si

Bence altı paralel skill tree'miz olmalı.

| Track | Öğreneceğimiz şey |
|---|---|
| Systems | memory, pointers, allocators, cache, data layout, OS |
| Gameplay | movement, collision, abilities, state machines, rules |
| Engine | game loop, ECS/data model, assets, events, serialization |
| Juice | animation, particles, hitstop, camera, audio, feedback |
| Simulation | determinism, snapshots, rewind, replay |
| Multiplayer | sockets, client/server, prediction, state sync |

Renderer, tooling, debugging ve profiling bunların arasında sürekli büyüyecek.

Ama bunları ayrı ayrı kurslar gibi öğrenmeyeceğiz.

Her oyun birkaç dalı birlikte geliştirecek.

### Phase 0 — Frontend Developer'dan Systems Programmer'a geçiş

Burada oyun yok denecek kadar az olacak. Ama uzun da sürmemeli.

Amaç sana Odin syntax öğretmek değil.

Amaç şu kodun arkasında ne olduğunu sorgulatmak:

```odin
entities := make([]Entity, 1000)
```

Sorularımız:

```text
Bu memory nereden geldi?
Kaç byte?
Alignment ne?
Contiguous mı?
Stack mi heap mi?
Allocator kim?
Cache line'a nasıl düşüyor?
Entity'nin layout'u ne?
Copy yaptığımda kaç byte kopyalanıyor?
```

Mini projeler yaparız.

Memory arena.

Stack allocator.

Dynamic array.

Ring buffer.

Object pool.

String builder.

Binary serializer.

Bunları production-ready library yapmak için değil, **mekanizmayı anlamak için** yazarsın.

Sonra ilk gerçek oyuna geçeriz.

### Game 1 — Pong: Frame'i anlamak

Pong'u “ilk oyun tutorialı” olarak görmemeliyiz.

Pong bize **bir frame'in ne olduğunu** öğretmeli.

Burada öğreneceğin ana kavramlar:

```text
game loop
input
delta time
fixed timestep
position / velocity
AABB collision
collision response
game state
audio
render/update separation
```

Ama oyunu üç defa geliştireceğiz.

#### Pong 0

Çalışıyor.

#### Pong 1

İyi hissettiriyor.

Ball impact.

Hit pause.

Screen shake.

Particle.

Trail.

Sound pitch.

Squash/stretch.

#### Pong 2

Sistemleşiyor.

Artık soruyoruz:

> Camera shake neden Ball kodunun içinde?
>
> Particle neden collision sistemini biliyor?
>
> Audio event nasıl tetiklenmeli?

Buradan ilk küçük engine API'leri çıkacak.

### Game 2 — Snake: Data-Oriented Programming

Snake özellikle senin geçmişin için mükemmel.

Frontend tarafında muhtemelen şöyle düşünmeye alışkınsın:

```text
Snake
 └── Segments[]
       └── Segment
```

Biz bunu memory olarak göreceğiz.

Snake üzerinden:

```text
arrays
ring buffers
grids
occupancy
AoS vs SoA
cache locality
allocation
state representation
```

öğreneceğiz.

Ve ilk ciddi constraint gelecek:

> **Gameplay sırasında heap allocation yasak.**

Bu seni düşük seviyeli düşünmeye zorlayacak.

### Game 3 — Breakout: Juice Laboratory

Breakout'u tamamen **game feel** laboratuvarı yapardım.

Amaç oyun yapmak değil:

> Aynı mekanik neden bir versiyonda ucuz, diğerinde inanılmaz iyi hissettiriyor?

Burada juice toolkit doğar.

Tween.

Screen trauma.

Particles.

Animation curves.

Hitstop.

Freeze frames.

Color flash.

Audio variation.

Camera impulse.

Trail.

Impact response.

Bu oyun sonunda kendi küçük:

```text
fx/
animation/
camera/
audio/
particles/
```

katmanın ortaya çıkabilir.

Ve bunların hepsi gerçek ihtiyaçtan doğmuş olur.

### Game 4 — Precision Platformer: Dead Cells DNA'sı başlıyor

Burada artık gerçekten sevdiğin tarafa giriyoruz.

İlk hedef Dead Cells yapmak değil.

**Dead Cells movement'ını parçalamak.**

Character controller yazacağız.

Running.

Acceleration.

Deceleration.

Jump.

Variable jump height.

Coyote time.

Jump buffering.

Wall interactions.

Dash.

Drop-through platform.

Ledge forgiveness.

Buradaki önemli ders:

> “Physics doğru mu?” değil, “movement iyi hissettiriyor mu?”

Örneğin gerçek fizik açısından karakterin havada yön değiştirmesi saçma olabilir.

Ama oyun açısından harika olabilir.

Game programming'in temel ayrımlarından birini burada öğreneceksin:

**simulation correctness ≠ game feel correctness**

Sonra combat ekleriz.

Attack startup.

Active frames.

Recovery.

Hitbox / hurtbox.

Knockback.

Hitstop.

Cancel windows.

Invulnerability frames.

Burada state machine ve animation/gameplay synchronization öğrenirsin.

Bu proje senin ilk büyük **Boss Fight** oyunlarından biri olur.

### Game 5 — Baba-lite: Rules as Data

Burada Baba Is You'dan direkt ilham alıyoruz.

Ama Baba Is You klonu yapmayacağız.

Sadece çekirdeği:

```text
ROCK IS PUSH
WALL IS STOP
FLAG IS WIN
```

gibi kurallar.

İlk anda bunu şöyle yazmak kolay:

```odin
if entity.kind == .Rock {
    push(entity)
}
```

Ama bunu yapmana izin vermem.

Çünkü burada öğreneceğimiz şey:

> **Kurallar kod değil data olabilir mi?**

World içindeki entity'lerin özellikleri runtime'da değişebilecek.

```text
ROCK IS YOU
WATER IS WIN
PLAYER IS PUSH
```

Engine'in buna tepki vermesi gerekiyor.

Buradan çok ciddi konular çıkar.

Composition.

Runtime properties.

Tags.

Relations.

Rule evaluation.

Dependency systems.

Query architecture.

Event propagation.

Bu proje ECS'yi konuşmak için mükemmel zaman olabilir.

Çünkü artık ECS'nin çözdüğü problem gerçekten ortaya çıkmış olacak.

### Game 6 — Braid-lite: Rewindable World

Bu curriculum'un en değerli projelerinden biri olur.

Küçük bir platform oyunu düşün.

Sonra:

> `R` basınca dünya geriye gidiyor.

İlk naive çözüm:

Her frame bütün world state'i kopyala.

Çalışıyor.

Sonra profiling.

```text
100 entity
1000 entity
10.000 entity
```

Memory patlamaya başlıyor.

Buradan bir anda çok ciddi engine konularına giriyoruz.

Snapshot.

Ring buffer.

Serialization.

State diff.

Event sourcing.

Determinism.

Replay.

Temporal state.

State ownership.

Entity identity.

Ve sana şu soruyu sorduracağım:

> Particle rewind edilmeli mi?
>
> Audio rewind edilmeli mi?
>
> Animation rewind edilmeli mi?
>
> RNG rewind edilmeli mi?

İşte burada gerçek engine architecture başlıyor.

Çünkü artık **game state ile presentation state'i ayırmak zorundasın.**

Bu ayrım ileride multiplayer'ın da temelini oluşturacak.

### Game 7 — PICO PARK tarzı Local Co-op

Networking'e hemen geçmeyeceğiz.

Önce aynı bilgisayarda 2–4 oyuncu.

Ama oyun çok basit olacak.

Push.

Jump.

Carry.

Buttons.

Doors.

Moving platforms.

Birbirinin üzerine çıkma.

Ama önemli konu:

```text
Player 1
Player 2
Player 3
Player 4
```

diye dört farklı kod yazmayacağız.

Burada input abstraction ortaya çıkacak.

```text
Device
    Keyboard
    Gamepad

Player
    InputSource
```

Sonra oyuncu join/leave.

Controller hotplug.

Local multiplayer camera.

Respawn.

Shared checkpoints.

Bunların hepsi engine-level problemler.

### Game 8 — BOKURA-lite: Two Realities

İşte burada senin sevdiğin oyunlardan çok özel bir mechanic çıkarabiliriz.

World aynı.

Simulation aynı.

Ama:

```text
Player A:
entity 42 = Rabbit

Player B:
entity 42 = Robot
```

Burada çok önemli bir mimari ayrım öğrenirsin.

**Simulation ≠ Presentation**

World state:

```text
Entity #42
type: enemy
position: ...
state: ...
```

Presentation:

```text
Player A perception:
    sprite = animal

Player B perception:
    sprite = machine
```

Bu bir anda shader/renderer probleminden çok daha ilginç bir engine problemine dönüşür.

Per-player representation.

Visibility.

Perspective.

Information ownership.

Conditional interactions.

Bu yapı multiplayer'a geçtiğimizde inanılmaz değerli olacak.

### Game 9 — We Were Here tarzı Networked Puzzle

Artık online multiplayer.

Ama shooter yapmayacağız.

Çünkü ilk network oyununda FPS prediction/resimulation cehennemine girmek gereksiz.

İki oyunculu puzzle çok daha güzel.

Player A bir sembol görüyor.

Player B başka bir information görüyor.

Birlikte çözmeleri gerekiyor.

Burada:

```text
TCP / UDP
sockets
packet structure
serialization
latency
disconnect
reconnect
lobby
server authority
client authority
state replication
RPC
```

öğrenebiliriz.

Ve BOKURA projesinden gelen:

**per-player information**

fikrini artık network security problemine dönüştürürüz.

Server Player A'ya Player B'nin gizli bilgisini **hiç göndermemeli**.

Bu çok önemli.

Çünkü artık gameplay design ile network architecture birleşiyor.

### Game 10 — Storyteller-lite: Combinatorial Game Logic

Bence senin için en ilginç projelerden biri bu olur.

Örneğin:

```text
Alice loves Bob
Bob kills Alice
Charlie sees murder
```

Sonuç:

```text
Charlie hates Bob
Bob becomes murderer
Alice becomes dead
```

Scene değiştir.

Character değiştir.

Relationship değiştir.

Engine sonuçları yeniden hesaplıyor.

Burada öğreneceğimiz:

Graph.

Relations.

State transitions.

Rule engine.

Dependency graph.

Reactive evaluation.

Constraint solving.

Burada React geçmişin bile garip şekilde tekrar karşına çıkabilir.

Çünkü şu fikir:

```text
state değişti
→ dependency değişti
→ output yeniden hesaplandı
```

sana çok yabancı değil.

Ama bu sefer React DOM render etmiyor.

**Bir simulation çalıştırıyor.**

### Sonra asıl zor şey geliyor

Bu projelerden sonra ilk defa:

> “Benim engine'im ne?”

diye soracağız.

Ve cevabın büyük ihtimalle Unreal gibi olmayacak.

Engine'in şu tarz bir şey olabilir:

```text
Core
├── Memory
├── Containers
├── Math
├── Time
└── Logging

Platform
├── Window
├── Input
├── File IO
└── Networking

Simulation
├── World
├── Entity
├── Rules
├── Events
├── Snapshot
└── Replay

Presentation
├── Renderer
├── Animation
├── Audio
├── Particles
└── Camera

Gameplay
├── Character Controller
├── Interaction
├── Abilities
└── Puzzle Rules

Tools
├── Debug UI
├── Inspector
├── Profiler
├── Asset Pipeline
└── Replay Viewer
```

Burada özellikle **Simulation / Presentation ayrımı** senin engine'inin merkezi olabilir.

Çünkü sevdiğin oyunların çoğu bunu kullanıyor.

Braid:

```text
Simulation → farklı zaman
```

BOKURA:

```text
Simulation → farklı presentation
```

We Were Here:

```text
Simulation → farklı information
```

Baba Is You:

```text
Simulation → runtime rule mutation
```

Storyteller:

```text
Simulation → rule evaluation
```

Bunlar aslında birbirinden tamamen bağımsız fikirler değil.

## Final Capstone fikrim

Şimdiden yapmanı istemiyorum fakat yolun sonundaki oyunu kabaca görebiliriz.

2-player cooperative puzzle platformer.

İki oyuncu aynı dünyada.

Ama dünyayı farklı görüyorlar.

Bazı objeler Player A için başka özelliklere sahip görünüyor.

Bazıları Player B için başka.

Oyunculardan biri bazı kuralları değiştirebiliyor.

Diğeri zamanı belirli objeler için geri sarabiliyor.

Örneğin:

```text
Player A:
Bridge = broken

Player B:
Bridge = intact
```

Ama simulation'da bridge'in gerçek bir state'i var.

Bir oyuncu geçmişte bridge'in kırılmasını rewind ediyor.

Diğer oyuncu kendi perspective'inde değişen environment'ı kullanıyor.

Bazı puzzle'larda:

```text
BOX IS HEAVY
```

gibi world rule'ları değişebilir.

Bunu network üzerinden synchronized çalıştır.

Bu oyunu bitirebilirsen curriculum sonunda şu sistemlere dokunmuş olursun:

**rendering, networking, simulation, rewind, serialization, rule engines, multiplayer, tools, input, physics, animation, audio, juice ve engine architecture.**

Ve daha önemlisi bunların hiçbirini “tutorial'da vardı” diye yazmamış olursun.

**Oyunun ihtiyacı olduğu için yazmış olursun.**

## Eğitim sistemimizin bir kuralı

Her projede benim rolüm giderek azalmalı.

Pong'da sana oldukça fazla yön gösterebilirim.

Snake'te daha az.

Platformer'da API tasarımını sen yaparsın, ben review ederim.

Braid-like projede sana sadece requirements ve test senaryoları veririm.

Networked puzzle'da architecture'ı tamamen sen önerirsin.

Final projede ise ilişkimiz kabaca:

**sen = engine programmer**  
**ben = staff/principal engineer code reviewer**

gibi olur.

Bence senin için klasik lineer kurs yerine bu progression çok daha güçlü olur.

Bir sonraki adımda artık bunu **gerçek bir Boot.dev benzeri curriculum'a** çevirebiliriz: `World → Chapter → Lesson → Challenge → Boss Fight` yapısını kurup **World 1: Systems Foundations + Pong** bölümünü ders ders, challenge challenge tasarlayabiliriz. İlk birkaç haftada tam olarak ne yazacağını bile belirleyebiliriz.

---

## User

çok güzel şimdi nasıl başlayabiliriz ve nereden devam edebiliriz buna ?

---

## Assistant

Bence **bugün doğrudan başlayabiliriz**. Önümüzdeki 6 ayın bütün derslerini baştan yazmak yerine curriculum'un omurgasını sabitleyelim, sadece içinde bulunduğumuz `World`ü detaylandıralım. Böylece öğrendiklerine göre rota değişebilir.

Çalışma şeklimiz şöyle olsun:

```text
Ben:
Concept → Challenge → Constraints → Acceptance Criteria

Sen:
Önce düşün
→ kodu yaz
→ çalıştır
→ bana kodu / problemi getir

Ben:
Review
├── Correctness
├── Memory
├── Performance
├── Architecture
├── Odin idioms
└── Game-dev implications

Takılırsan:
Hint 1 → Hint 2 → Hint 3 → gerekirse birlikte çözüm

Geçersen:
XP + bir sonraki lesson
```

Ve önemli bir kural: **normalde sana ilk mesajda çözümü vermeyeceğim.** Çünkü burada beni Stack Overflow gibi kullanırsak öğrenme değeri çok düşer.

## Repo'yu böyle kuralım

Tek bir uzun soluklu repo istiyorum:

```text
game-engine-journey/
│
├── README.md
├── progress.md
│
├── journal/
│   ├── 000-start.md
│   ├── 001-memory-layout.md
│   └── ...
│
├── labs/
│   ├── 00-memory-layout/
│   ├── 01-pointers-slices/
│   └── ...
│
├── games/
│   ├── 01-pong/
│   ├── 02-snake/
│   ├── 03-breakout/
│   └── ...
│
├── engine/
│   └── ...
│
└── experiments/
    └── ...
```

`engine/` başlangıçta **boş** olacak.

Hatta özellikle boş bırakmanı istiyorum.

Çünkü henüz engine'imiz yok.

Pong'daki bir şeyi Snake'te tekrar kullanırsın. Breakout'ta üçüncü kez ihtiyaç duyarsın. O zaman:

> "Tamam, bu artık game-specific değil."

deyip `engine/` içine taşırız.

Bu bizim temel tasarım prensibimiz olacak.

## Progress dosyası

`progress.md` kabaca şöyle yaşayabilir:

```md
# Game Engine Developer Journey

## Current
World 0 — Systems Foundations
Chapter 1 — Memory

## Level
Level 0

## XP
0

## Completed
-

## Concepts
### Comfortable
-

### Learning
- Memory layout
- Alignment
- Padding

### Revisit
-

## Games
- [ ] Pong
- [ ] Snake
- [ ] Breakout
- [ ] Precision Platformer
- [ ] Baba-like
- [ ] Rewind Platformer
- [ ] Local Co-op
- [ ] Two Realities
- [ ] Networked Puzzle
- [ ] Storyteller-like

## Engine Systems
Henüz yok.

## Technical Debt
-

## Questions
-
```

Bunu ilerledikçe değiştireceğiz.

## World 0 — Systems Foundations

Bunu uzun tutmak istemiyorum.

Sen 5-6 yıllık yazılımcısın. Sana:

```text
variable nedir
function nedir
for loop nedir
```

anlatmayacağım.

World 0'ın amacı şu dönüşümü başlatmak:

```text
TypeScript programmer

        ↓

Memory-aware programmer

        ↓

Systems programmer
```

İlk etapta yaklaşık şu konularımız var:

```text
Chapter 1 — Memory
    0.1 Layout / Padding / Alignment
    0.2 Pointers / Slices / Lifetimes
    0.3 Stack / Heap / Allocators
    Boss: allocation-free simulation

Chapter 2 — Data
    0.4 Arrays / Dynamic Arrays
    0.5 AoS vs SoA
    0.6 Cache locality
    Boss: 100k entities

Chapter 3 — Game Loop
    → PONG
```

Yani aylarca console programı yazdırmayacağım.

**Mümkün olan en kısa sürede ekranda bir şey hareket edecek.**

## Lesson 0.1 — Memory Is Not An Abstraction

**100 XP**

İlk görevimiz grafik içermiyor.

Fakat doğrudan oyun programlama problemi.

Bir bullet struct'ımız olduğunu düşün.

```odin
Bullet :: struct {
    active:   bool,
    position: [2]f32,
    damage:   u16,
    owner:    u8,
    velocity: [2]f32,
    lifetime: f32,
}
```

### Challenge 0.1 — 100,000 Bullets

İlk olarak **programı çalıştırmadan** şunları tahmin et:

```text
size_of(Bullet) = ?
align_of(Bullet) = ?

offset active     = ?
offset position   = ?
offset damage     = ?
offset owner      = ?
offset velocity   = ?
offset lifetime   = ?
```

Ve bir kağıtta memory layout'u çiz.

Sonra Odin programında gerçek değerleri yazdır.

### Challenge Part II

Struct'taki field'ların sırasını değiştirebilirsin.

Ama hiçbir field'ı silemezsin ve hiçbir field'ın type'ını değiştiremezsin.

Yeni bir `Bullet_Optimized` oluştur.

Amaç:

> Struct'ın boyutunu mümkün olduğunca küçült.

### Challenge Part III

100,000 bullet için memory kullanımını hesapla.

Sadece "daha az RAM" değil, cache açısından da düşün.

### Bonus Challenge — AoS vs SoA

`update_bullets()` sadece position, velocity, lifetime, active kullanıyorsa AoS mi SoA mı daha avantajlı olabilir ve neden?

### Acceptance Criteria

- Tahminleri çalıştırmadan önce yaz
- Odin ile doğrula
- Padding'i göster
- Daha küçük ordering dene
- 100.000 bullet memory kullanımını hesapla
- AoS vs SoA'yı kendi kelimelerinle açıkla

Bana göndermen beklenenler:

```text
1. Tahminler
2. main.odin
3. Program output'u
4. Padding / field ordering / AoS vs SoA kısa açıklamaları
5. Soruların
```

Sonra Lesson 0.2: **Pointers, Slices & “Who Owns This Memory?”**

---

## User

peki codex cli kullansam daha iyi olmaz mı ? hem localimde kodları görmüş olursun ?

---

## Assistant

Evet — **bu proje için Codex CLI kullanman bence daha iyi olur.** Çünkü bizim yapmak istediğimiz şey yalnızca soru-cevap değil; repo içindeki gerçek kodu, klasör yapısını, build sonuçlarını, benchmark’ları ve zamanla oluşacak engine mimarisini birlikte takip etmek.

Ama bir ayrımı netleştireyim: **bu mevcut ChatGPT konuşması local diskinizi otomatik olarak görmez.** Codex CLI’ı projenin klasöründe çalıştırırsan, oradaki Codex oturumu izin verdiğin repository içeriğini okuyabilir, komut çalıştırabilir, test/build sonuçlarını görebilir ve dosyalarda değişiklik yapabilir. Codex ve normal ChatGPT sohbetlerinin bağlamı ise otomatik olarak aynı sohbetmiş gibi birleşmez.

Bizim kullanımımız için güzel bir model:

```text
game-engine-journey/
│
├── AGENTS.md
│
├── README.md
├── curriculum/
│   ├── ROADMAP.md
│   ├── world-00-systems.md
│   ├── world-01-pong.md
│   └── ...
│
├── progress/
│   ├── CURRENT.md
│   ├── SKILLS.md
│   └── XP.md
│
├── journal/
│
├── labs/
│
├── games/
│
└── engine/
```

Buradaki en önemli dosya **`AGENTS.md`** olur.

Örnek davranış:

```md
# Role

You are the mentor for Mücahit's Game Engine Developer curriculum.

The student's primary language is Odin.

The goal is NOT to generate games for the student.
The goal is to turn the student into a game engine developer.

## Teaching rules

- Never implement a challenge before the student attempts it.
- Prefer questions and hints over solutions.
- Use Hint Level 1, 2, and 3 progressively.
- Do not introduce abstractions before the student experiences the problem they solve.
- Do not build an engine upfront.
- Extract engine systems only after repeated use in games.
- Review code for:
  - correctness
  - memory
  - data layout
  - performance
  - architecture
  - Odin idioms
  - game feel
  - debuggability
```

Böylece terminalde kısa bir "continue my game engine curriculum" talebiyle local agent repo bağlamını kullanabilir.

Asıl büyük avantaj code review.

Challenge yaptıktan sonra dosyaları copy/paste etmek yerine Codex doğrudan kodu okuyabilir, `odin run .` gibi komutları çalıştırabilir ve output'u görebilir.

Ama önemli eğitim kuralı:

> **Codex kod yazan kişi olmayacak.**

"implement Pong" yerine "review my implementation, do not modify files, start with Hint Level 1" gibi promptlar kullanılmalı.

Ben olsam ChatGPT + Codex CLI'ı birlikte kullanırım.

Bu sohbet:

- Curriculum
- Büyük konular
- Architecture
- Oyun analizi
- Yeni World tasarımı

Codex CLI:

- Gerçek repo
- Challenge attempt
- Code review
- Build
- Test
- Benchmark
- Profiling
- Debugging

---

## User

birde ben boot.dev örneğini şeyden dolayı verdim ben websiteden okuyup code editörüne gelip öyle yapıyordum neler yapmam gerektiğini şimdide md dosyası üzerinden mi takip edeceğim ?

---

## Assistant

Hayır, bence seni `README.md` açıp ders okumaya mahkûm etmemeliyiz. Boot.dev örneğindeki esas değer **“ders ekranı ayrı, editör ayrı, ilerleme görünür”** hissi; bunu localde de gayet güzel kurabiliriz.

Markdown bizim veri kaynağımız olabilir; kullanıcı arayüzün Markdown dosyası olmak zorunda değil.

Bir local academy fikri önerildi:

```text
Browser / Academy
    ↓
World / Lesson / Challenge / Hints / XP

Editor
    ↓
Odin code

Codex CLI
    ↓
Review / build / run / test
```

Sıfırdan React uygulaması yazmak yerine VitePress gibi Markdown tabanlı bir site önerildi. Böylece Markdown içerik Codex için okunabilir, browser tarafında da düzgün ders arayüzü olur.

Potansiyel site görünümü:

```text
GAME ENGINE DEVELOPER

▼ World 0 — Systems Foundations
   ✓ 0.1 Memory Layout
   ● 0.2 Pointers & Slices
   ○ 0.3 Allocators
   🔒 Boss Fight

▶ World 1 — Pong
🔒 World 2 — Snake
...
```

Ders sayfası:

```text
WORLD 0 / CHAPTER 1 / LESSON 1

Memory Layout

GOAL
THEORY
PREDICT
CHALLENGE
HINTS
ACCEPTANCE CRITERIA
NEXT
```

Fakat önemli nokta:

> Proje Game Engine Developer olmak; Boot.dev klonu geliştirmek değil.

Bu nedenle academy UI ancak gerçekten faydalı olduğu kadar yapılmalı.

---

## User

ben bu chati daha çok sevdim bu öğrenmelere ImGui gibi bir şey eklesek nasıl olur ?

---

## Assistant

Evet. Hatta bunu ekleyince roadmap'in eksik olan önemli bir ayağı tamamlanıyor: **Tools / Debugging / Editor Development**.

Ama ImGui'yi “bir UI kütüphanesi daha öğrenelim” şeklinde değil, **engine programmer'ın kendi araçlarını üretmesi** için kullanmak istiyorum.

Örneğin oyun çalışırken bir Player Inspector:

```text
┌─ Player Inspector ─────────────┐
│ Position    341.2, 182.4       │
│ Velocity     92.0, -14.2       │
│ Grounded     true              │
│ State        DASH              │
│                               │
│ Coyote       █████░░  0.07     │
│ Jump Buffer  ░░░░░░░  0.00     │
│                               │
│ [ ] Draw Hitboxes             │
│ [✓] Draw Velocity             │
│ [✓] Infinite Health           │
└───────────────────────────────┘
```

Bu çok değerli çünkü yalnızca oyunu değil, **oyunun içini görebilmeyi** öğreniyorsun.

Curriculum'a yeni ana track eklendi:

```text
Systems
Gameplay
Engine
Juice
Simulation
Networking
TOOLS
```

### Pong — Debug Overlay

İlk etapta ImGui bile kullanmayabiliriz.

Ekrana FPS, ball position, velocity, dt gibi debug değerleri basarız. F1 ile collision shape gibi debug visualization açılır.

Ders:

> Bir engine programmer'ın ilk aracı debugger değil, çoğu zaman oyunun kendisine eklediği debug visualization'dır.

### Snake — Runtime State Inspector

- Snake length
- grid size
- occupied cells
- memory counters
- debug grid

### Breakout — Dear ImGui ilk defa

Breakout bir juice lab olduğu için runtime tuning paneli ideal:

```text
JUICE LAB

Ball Speed
Hit Stop Duration
Screen Shake Trauma/Decay
Particles Count/Lifetime/Spread
Audio Pitch Min/Max
```

Slider'lar oyun çalışırken değerleri değiştirir.

Bu sayede game feel değerleri ezberlenmez, parameter space deneysel olarak keşfedilir.

### Dead Cells-like Platformer

ImGui Player Inspector:

- state
- position
- velocity
- grounded
- coyote time
- jump buffer
- movement constants
- jump force
- dash settings
- hitbox/ground-ray/normal visualization

### Baba-like

Rule Inspector:

- active rules
- selected entity
- properties
- rule sources

### Braid-like

Timeline Debugger:

- frame scrubber
- snapshots count
- memory
- selected entity state by frame
- reverse/step/play controls

### Networking

Network debugger:

- ping
- packets/sec
- bandwidth
- simulated latency
- simulated packet loss
- disconnect/freeze packets
- client state mismatch view

### BOKURA-like

View mode:

```text
[ Simulation ]
[ Player A    ]
[ Player B    ]
```

Aynı entity'nin farklı perception/presentation'larını debug ederiz.

### Profiling

İleride mini profiler:

```text
FRAME PROFILER

update
physics
rules
animation
render
audio

Allocations this frame
Entities
Draw Calls
```

Sonra 100 / 1,000 / 10,000 / 100,000 entity ile davranışı ölçebiliriz.

### Editor progression

```text
Debug Text
    ↓
Debug Overlay
    ↓
ImGui Panel
    ↓
Inspector
    ↓
Profiler
    ↓
Timeline Debugger
    ↓
Entity Editor
    ↓
Mini Engine Editor
```

Editor baştan tasarlanmaz; ihtiyaçlardan doğal olarak çıkar.

### Important rule

**Dear ImGui ≠ Game UI.**

ImGui:

```text
✓ Debug UI
✓ Profiler
✓ Inspector
✓ Editor
✓ Cheats
✓ Visualization controls
✓ Runtime tuning
```

Ama varsayılan olarak şunlar için değil:

```text
✗ Main Menu
✗ Health bar
✗ Inventory
✗ Dialogue
✗ Player HUD
```

Oyuncu-facing UI ayrı bir problem olarak öğrenilir.

Son olarak roadmap artık daha net:

```text
                    GAME ENGINE DEVELOPER
                           │
       ┌───────────┬───────┼───────┬───────────┐
       ↓           ↓       ↓       ↓           ↓
    Systems     Gameplay  Engine  Tools     Rendering
       │           │       │       │           │
     Memory     Movement   Loop   ImGui       GPU
     Cache      Combat     ECS    Inspector    Shader
     Allocator  Rules      Assets Profiler    Batching
                           │
                 ┌─────────┴──────────┐
                 ↓                    ↓
             Simulation           Networking
              Rewind               Sync
              Replay               Prediction
              Rules                Replication
```

Tools track curriculum'un ana parçalarından biri olmalı.

Ayrıca kullanıcı chat deneyimini daha çok sevdiğini söylediği için academy sitesi yapmak zorunlu değil. Chat ana mentor ekranı olabilir; Odin localde yazılır; gerektiğinde Codex/repo araçları kullanılır.

---

## Current State at End of Transcript

- Odin remains the primary language.
- The chat is preferred as the main teaching interface.
- Codex CLI may be used as the local repo-aware reviewer/tool runner.
- Dear ImGui/tooling is now a first-class curriculum track.
- The first concrete lesson proposed remains **World 0 / Lesson 0.1 — Memory Layout / 100,000 Bullets**.
- That challenge has not yet been completed in this transcript.
