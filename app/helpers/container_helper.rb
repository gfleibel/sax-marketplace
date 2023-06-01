module ContainerHelper
  def hide_container?
    current_page?(root_path) || current_page?(saxophones_path)
  end
end
