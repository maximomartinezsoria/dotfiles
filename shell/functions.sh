function create_file_and_folder() {
  mkdir -p "$(dirname "$1")" || return
  touch "$1"
}
