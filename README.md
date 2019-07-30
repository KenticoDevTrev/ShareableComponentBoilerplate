# ShareableComponentBoilerplate
This boilerplate will get you started on creating a share-able Kentico MVC Component that you can publish to NuGet and to the marketplace.

# Instructions
## Clone and modify
1. Use this Template to create your own repostiory.
1. Download your repository onto your computer (I highly recommend making a separate "Kentico Repositories" folder that is not connected to your Kentico Admin nor Kentico MVC instance)
1. Once downloaded, run the RenameProject.bat and enter in your project information
1. Open the Solution file, right click on your solution and Clean Solution
1. Rebuild your solution (note, if you get a Roslyn.exe error, clean and build the Views Web App separately, this sometimes happens)

## (optional) Add to your Kentico Instance
It is recommended that for development of shareable content, you have a testing Kentico Instance, however this is not required.  You can create a fresh installation of Kentico 12, just make sure it's hotfixed to the Service Pack (hotfix 29)

1. Open your Kentico MVC Web App's solution
1. On the solution, right click and add Existing project, and select your Projects (View project is optional)
1. On your MVC Web App, right click on references and add a reference to your Component project.
1. Build your Component project, and the MVC Web Application Project

## Create NuGet Package
In the main component project, there is a `BuildPackage.bat` file.  Run this to create your nuget package.

You may want or need to modify the following:

### Assembly
When publishing new versions, you will want to open up your Solution, right click on your Component Project, and go to the Properties page.  You can click on "Assembly info" to update version and other information.

### Nuget Info
Modify the XXXX.nuspec file to add things such as Tags, Icons, release notes (you should update your release notes with what the update contains or the bug fixes perhaps).  You may also need to add additional <file> elements to include items beyond the Compiled Views library.  Please see [Microsoft Nuspec Documentation](https://docs.microsoft.com/en-us/nuget/reference/nuspec]) for more info.
  
## Targets Modification
There are 2 .Targets files, these can be modified to (on build) copy files to differnet projects.  This is needed for the Compiled Views (which is already pre-configured for you), but you can also modify it to move other files over from your library to your development MVC web app project.  Examples are given in the commented area.

Please remember, anything that needs to be exported with the nuget package needs to be handled in the nuspec file by copying the file into the Content location of the nuget package.
