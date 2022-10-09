import React, { useRef } from "react"

// const [isOpen, setOpen] = useState(false)
// const modalClose = () => setOpen(false)
// isOpen과 modalClose를 함께 넘겨주세요.
interface ModalProps {
  isOpen: boolean
  modalClose: any
  children: any
}

export default function SpinnerModal({
  isOpen,
  modalClose,
  children,
}: ModalProps) {
  const outModal = useRef<HTMLInputElement>(null)

  const showHide = isOpen
    ? "visible z-50 block rounded-full"
    : "hidden z-10 block rounded-full"

  return (
    <div
      className={showHide}
      aria-labelledby="modal-title"
      role="dialog"
      aria-modal="true"
    >
      <div className="fixed inset-0 z-10 transition-opacity bg-gray-500 bg-opacity-75"></div>
      <div
        className="fixed inset-0 z-10 overflow-y-auto"
        // onClick={(event) => {
        //   if (event.target === outModal.current) {
        //     modalClose()
        //   }
        // }}
      >
        <div
          className="flex items-end justify-center min-h-full text-center sm:items-center "
          ref={outModal}
        >
          <div className="relative overflow-hidden transition-all transform sm:max-w-lg sm:w-full">
            <div className="flex items-center justify-center mapleStory">
              {children}
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
