const info = [
  "Ohmygod.jpg",
  "Milkyway.png",
  "Cave.jpg",
  "Kitten.jpg",
  "Goat.jpg",
  "Surfing.jpg",
  "Ghost.jpg",
  "Busking.png",
  "Eyepressure.png",
  "Climbing.png",
  "Smartbox.png",
  "Oldhouse.png",
  "Threecats.png",
  "Squirrel.jpg",
  "Fashion.jpg",
  "Telescope.jpg",
  "Tambourine.jpg",
  "Bowl.jpg",
  "Start.jpg",
  "Honeycomb.png",
  "Wisp.png",
  "Gilchi.png",
  "Godjoke.png",
  "Bully.png",
  "Lastapple.png",
  "Flyingdisk.png",
  "Fruitsales.png",
  "Movehometown.png",
  "Grandfa.jpg",
  "Tiger.jpg",
  "Potato.jpg",
  "Turtle.jpg",
  "Leuno.jpg",
  "Panda.jpg",
  "Dalgona.jpg",
  "Owl.jpg",
  "Monkey.jpg",
  "Guinea.jpg",
  "Bear.jpg",
  "Fox.jpg",
  "Bicycle.jpg",

  "Rain.png",
  "Dogvalues.png",
  "Tigercard.png",
  "Stoneskipping.png",
  "Trash.jpg",
  "Snow.jpg",
  "Parrot.jpg",
  "Gargoyle.jpg",
  "Hamster.jpg",
  "Themepark.jpg",
  "jung2.jpg",
  "Stock.jpg",
  "Fan.jpg",
  "Duck.jpg",
  "Peacock.jpg",
  "Crab.jpg",
  "Giraffe.jpg",
  "Badpainter.png",
  "Waterfall.png",
  "Bookstore.png",
  "Bridge.png",
  "Sports.jpg",
  "Koala.jpg",
  "Pig.jpg",
  "Bag.jpg",
]

export default function Picture() {
  return (
    <div className="w-full h-full">
      <div className="flex flex-wrap justify-center w-full h-full p-2 overflow-scroll scrollbar-hide">
        <div></div>
        {info.map((url) => {
          return (
            <div className="border-4  w-[293px] text-center m-2 rounded-lg leading-[42px] mapleStory shadow-md flex bg-beige-500 border-white ">
              <img src={`/assets/illust/${url}`} className="w-full h-full" />
            </div>
          )
        })}
        {info.length % 2 !== 0 && <div className="w-[340px] "></div>}
      </div>
    </div>
  )
}
