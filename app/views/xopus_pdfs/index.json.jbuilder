json.array!(@xopus_pdfs) do |xopus_pdf|
  json.extract! xopus_pdf, :id
  json.url xopus_pdf_url(xopus_pdf, format: :json)
end
