class Vegetable < ApplicationRecord
  include ActiveModel::Validations
  has_one_attached :qrcode
  before_commit :generate_qrcode, on: :create
  validates :name, presence: true
	validates :name, uniqueness: true
  validates :price, presence: true
  validates :available, inclusion: { in: [ true, false ] }

  private

  def generate_qrcode
    qrcode = RQRCode::QRCode.new("Mango")
        # Create the PNG object
        png = qrcode.as_png(
            bit_depth: 1,
            border_modules: 4,
            color_mode: ChunkyPNG::COLOR_GRAYSCALE,
            color: "black",
            file: nil,
            fill: "white",
            module_px_size: 6,
            resize_exactly_to: false,
            resize_gte_to: false,
            size: 120
        )

        self.qrcode.attach(
            io: StringIO.new(png.to_s),
            filename: "qrcode.png",
            content_type: "image/png"
        )
  end
end
