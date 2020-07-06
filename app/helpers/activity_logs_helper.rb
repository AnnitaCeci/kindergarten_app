module ActivityLogsHelper
  STATUS = ["Terminada", "En Progreso"]
  def status(duration)
    duration ? "Terminada" : "En Progreso"
  end

  def duration(duration)
    duration ? duration.to_s + " min" : "*"
  end
end
