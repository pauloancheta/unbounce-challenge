class ExportToHtml
  include Virtus.model

  attribute :rows

  def call
    print_html
  end

  private

  def print_html
    """
<!DOCTYPE html>
<html>
  <head>
    <title>Unbounce Challenge</title>
  </head

  <body>
    <div style='max-width: 600px; margin: 0 auto;'>
      <marquee><h1>A-Team Programming Challenge</h1></marquee>
      <table style='margin: 0 auto;'>
        <thead>
          <tr>
            <th>File Name</th>
            <th>Latitude</th>
            <th>Longitude</th>
          </tr>
        </thead>
        <tbody>
          #{print_rows}
        </tbody>

      </table>
    </div>
  </body>

</html>
    """
  end

  def print_rows
    rows.map do |row|
      """
<tr>
  <td>#{row.filename}</td>
  <td>#{row.latitude}</td>
  <td>#{row.longitude}</td>
</tr>
      """
    end.join(" ")
  end
end
