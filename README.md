# Research Project Template

Very simple research project template to make setting up new projects easy.

## Installation

1. Clone repo to a place where it can stay
2. `$ chmod +x /path/to/create_project_template.sh`
3. Add the following lines to your ./bash_profile:
    > \# create empty research project  
    > alias crp='source /path/to/create_research_project.sh'
4. Create a new project like so:
    `$ crp my_project_name`

This will create the raw folder structure and commit everything to a local Git repository.  

You can also pass a second argument, which should be the path to an empty, initialized Github repo (i.e. https://github.com/lukaskawerau/my_project_name.git), which will automatically push the first commit to that empty repo.  
In this case, the workflow for creating a new project looks like this:  

1. Create a new project on Github: no README.md, no .gitignore
2. Copy the link to the project
3. Go to the place where you want to create your project (e.g. ~/Documents/research/)
4. Create a new project like so:
    `$ crp my_project_name https://github.com/lukaskawerau/my_project_name.git`


BOOM, you're off to the races.
