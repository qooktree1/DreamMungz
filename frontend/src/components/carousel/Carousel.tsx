export default function Carousel(carouselInfo: any) {
  const firstCarousel = carouselInfo.carouselInfo[0].image

  return (
    <div
      id="carouselExampleIndicators"
      className="relative h-full carousel slide"
      data-bs-ride="carousel"
    >
      <div className="absolute bottom-0 left-0 right-0 flex justify-center p-0 mb-4 carousel-indicators">
        <button
          type="button"
          data-bs-target="#carouselExampleIndicators"
          data-bs-slide-to="0"
          className="active"
          aria-current="true"
        ></button>
        <button
          type="button"
          data-bs-target="#carouselExampleIndicators"
          data-bs-slide-to="1"
        ></button>
        <button
          type="button"
          data-bs-target="#carouselExampleIndicators"
          data-bs-slide-to="2"
        ></button>
      </div>
      <div className="relative w-full h-full overflow-hidden carousel-inner">
        <div className="float-left w-full carousel-item active">
          <img src={firstCarousel} className="block object-cover rounded-3xl" />
        </div>

        {carouselInfo.carouselInfo.map((image: any, index: number) => {
          if (index !== 0) {
            return (
              <div className="float-left w-full carousel-item" key={index}>
                <img
                  src={image.image}
                  className="block object-cover rounded-3xl"
                />
              </div>
            )
          }
        })}
      </div>
      <button
        className="absolute top-0 bottom-0 left-[-40px] flex items-center justify-center p-0 text-center border-0 carousel-control-prev hover:outline-none hover:no-underline focus:outline-none focus:no-underline"
        type="button"
        data-bs-target="#carouselExampleIndicators"
        data-bs-slide="prev"
      >
        <span
          className="inline-block bg-no-repeat carousel-control-prev-icon"
          aria-hidden="true"
        ></span>
        <span className="visually-hidden">Previous</span>
      </button>
      <button
        className="absolute top-0 bottom-0 right-[-40px] flex items-center justify-center p-0 text-center border-0 carousel-control-next hover:outline-none hover:no-underline focus:outline-none focus:no-underline"
        type="button"
        data-bs-target="#carouselExampleIndicators"
        data-bs-slide="next"
      >
        <span
          className="inline-block bg-no-repeat carousel-control-next-icon"
          aria-hidden="true"
        ></span>
        <span className="visually-hidden">Next</span>
      </button>
    </div>
  )
}
