module ActivityLogsHelper

  STATUS = ['Terminada', 'En Progreso']

  def status(duration)
    duration ? 'Terminada' : 'En Progreso'
  end

  def duration(duration)
    duration ? duration.to_s + ' min' : '*'
  end
  def format_date(date)
    date ? (date.strftime '%Y-%m-%d %H:%M') : "Pendiente"
  end
end
