#!/bin/bash

# Function to display usage instructions
usage() {
    echo "Usage: $0 [option]"
    echo "Options:"
    echo "  create_dir 'directory_name'    Create a new directory"
    echo "  list_files                     List files in the current directory"
    echo "  copy 'source_file' 'destination_directory'    Copy a file to another directory"
    echo "  move 'source_file' 'destination_directory'    Move a file to another directory"
    echo "  delete 'file_name'             Delete a file"
    echo "  rename 'old_name' 'new_name'   Rename a file"
    echo "  search 'file_name'              Search for a file"
    echo "  details 'file_name'             View details of a file"
    echo "  help                           Show usage instructions"
}

# Function to create a new directory
create_dir() {
    directory_name="$1"
    mkdir "$directory_name" && echo "Directory '$directory_name' created."
}

# Function to list files in the current directory
list_files() {
    echo "Files in the current directory:"
    ls -l
}

# Function to copy a file to another directory
copy_file() {
    source_file="$1"
    destination_directory="$2"
    cp "$source_file" "$destination_directory" && echo "File '$source_file' copied to '$destination_directory'."
}

# Function to move a file to another directory
move_file() {
    source_file="$1"
    destination_directory="$2"
    mv "$source_file" "$destination_directory" && echo "File '$source_file' moved to '$destination_directory'."
}

# Function to delete a file
delete_file() {
    file_name="$1"
    rm "$file_name" && echo "File '$file_name' deleted."
}

# Function to rename a file
rename_file() {
    old_name="$1"
    new_name="$2"
    mv "$old_name" "$new_name" && echo "File '$old_name' renamed to '$new_name'."
}

# Function to search for a file
search_file() {
    file_name="$1"
    echo "Searching for file '$file_name'..."
    find . -name "$file_name"
}

# Function to view details of a file
file_details() {
    file_name="$1"
    echo "Details of file '$file_name':"
    stat "$file_name"
}

# Check command-line arguments
if [ "$#" -eq 0 ]; then
    usage
    exit 1
fi

# Parse command-line arguments
case "$1" in
    create_dir)
        if [ -z "$2" ]; then
            echo "Please provide a directory name."
            exit 1
        fi
        create_dir "$2"
        ;;
    list_files)
        list_files
        ;;
    copy)
        if [ -z "$2" ] || [ -z "$3" ]; then
            echo "Please provide source file and destination directory."
            exit 1
        fi
        copy_file "$2" "$3"
        ;;
    move)
        if [ -z "$2" ] || [ -z "$3" ]; then
            echo "Please provide source file and destination directory."
            exit 1
        fi
        move_file "$2" "$3"
        ;;
    delete)
        if [ -z "$2" ]; then
            echo "Please provide a file name."
            exit 1
        fi
        delete_file "$2"
        ;;
    rename)
        if [ -z "$2" ] || [ -z "$3" ]; then
            echo "Please provide old and new file names."
            exit 1
        fi
        rename_file "$2" "$3"
        ;;
    search)
        if [ -z "$2" ]; then
            echo "Please provide a file name to search."
            exit 1
        fi
        search_file "$2"
        ;;
    details)
        if [ -z "$2" ]; then
            echo "Please provide a file name to view details."
            exit 1
        fi
        file_details "$2"
        ;;
    help)
        usage
        ;;
    *)
        echo "Invalid option"
        usage
        exit 1
        ;;
esac

exit 0
