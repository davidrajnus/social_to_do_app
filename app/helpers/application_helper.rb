module ApplicationHelper

  def full_title(page_title = '')
    base_title = "TO DO App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def daily_weather
    @forecast = ForecastIO.forecast(37.8267, -122.423, params: { units: 'si' })
    return @forecast.daily.data.first(6)
  end

end
