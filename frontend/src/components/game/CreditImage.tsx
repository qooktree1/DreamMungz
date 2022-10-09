export default function CreditImage({
  imgUrl,
  title,
  sequence,
}: {
  imgUrl: string
  title: string
  sequence: number
}) {
  return (
    // 사진 image 사이즈 : w-[487px] h-[250px]
    <div className="flex justify-center text-normal">
      {sequence % 2 === 0 ? (
        // 오른쪽 사진
        <div className="w-[400px] h-[300px] bg-white shadow-2xl px-4 pt-4 rotate-12">
          <img
            src="images/pin.png"
            alt="핀 이미지"
            className="w-[50px] right-[50%] top-[-40px] absolute z-[30] -rotate-[80deg]"
          />
          <div className="h-[70%] m-0 p-0">
            <img
              src={`/assets/illust/${imgUrl}`}
              alt="엔딩크레딧 이미지"
              className="h-full"
            />
          </div>
          <div className="h-[30%] flex items-center justify-center">
            <p className="mapleStory">{title}</p>
          </div>
        </div>
      ) : (
        // 왼쪽 사진
        <div className="w-[400px] h-[300px] bg-white shadow-2xl px-4 pt-4 -rotate-12">
          <img
            src="images/pin.png"
            alt="핀 이미지"
            className="w-[50px] left-[50%] top-[-40px] absolute z-[30] -rotate-12"
          />
          <div className="h-[70%]">
            <img
              src={`/assets/illust/${imgUrl}`}
              alt="엔딩크레딧 이미지"
              className="h-full"
            />
          </div>
          <div className="h-[30%] flex items-center justify-center">
            <p className="mapleStory">{title}</p>
          </div>
        </div>
      )}
    </div>
  )
}
