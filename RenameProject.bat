@echo off
set /p ToolName="Enter ToolName (a-Z_):"
set /p Prefix="Enter Assembly Prefix (a-Z_.), usually Company (ex 'HBS.'):"
set /p PostFix="Enter Assembly Postfix (a-Z_.) (ex '.Kentico.MVC'):"
set /p GitHubUrl="Enter GitHub Url:"
set /p Tags="Enter NuGet Tags (space separated):"


cd ShareableComponentBoilerplate.Views
cd Views
cd Shared
cd Widgets
powershell -Command "(gc _ShareableComponentBoilerplate.cshtml) -replace 'CompanyName.ShareableComponentBoilerplate.Kentico.MVC', '%Prefix%%ToolName%%PostFix%' | Out-File -encoding ASCII _ShareableComponentBoilerplate.cshtml"
powershell -Command "(gc _ShareableComponentBoilerplate.cshtml) -replace 'ShareableComponentBoilerplate', '%ToolName%' | Out-File -encoding ASCII _ShareableComponentBoilerplate.cshtml"
rename _ShareableComponentBoilerplate.cshtml _%ToolName%.cshtml
cd..
cd..
cd..

powershell -Command "(gc ShareableComponentBoilerplate.Views.csproj) -replace 'CompanyName.ShareableComponentBoilerplate.Kentico.MVC', '%Prefix%%ToolName%%PostFix%' | Out-File -encoding ASCII ShareableComponentBoilerplate.Views.csproj"
powershell -Command "(gc ShareableComponentBoilerplate.Views.csproj) -replace 'ShareableComponentBoilerplate', '%ToolName%' | Out-File -encoding ASCII ShareableComponentBoilerplate.Views.csproj"
rename ShareableComponentBoilerplate.Views.csproj %ToolName%.Views.csproj
rename ShareableComponentBoilerplate.Views.csproj.user %ToolName%.Views.csproj.user
cd..

rename ShareableComponentBoilerplate.Views %ToolName%.Views

cd ShareableComponentBoilerplate
powershell -Command "(gc BuildPackage.bat) -replace 'ShareableComponentBoilerplate', '%ToolName%' | Out-File -encoding ASCII BuildPackage.bat"

powershell -Command "(gc ShareableComponentBoilerplateWidget.cs) -replace 'CompanyName.ShareableComponentBoilerplate.Kentico.MVC', '%Prefix%%ToolName%%PostFix%' | Out-File -encoding ASCII ShareableComponentBoilerplateWidget.cs"
powershell -Command "(gc ShareableComponentBoilerplateWidget.cs) -replace 'ShareableComponentBoilerplate', '%ToolName%' | Out-File -encoding ASCII ShareableComponentBoilerplateWidget.cs"
powershell -Command "(gc ShareableComponentBoilerplateWidget.cs) -replace 'CompanyName.', '%Prefix%' | Out-File -encoding ASCII ShareableComponentBoilerplateWidget.cs"
rename ShareableComponentBoilerplateWidget.cs %ToolName%Widget.cs

powershell -Command "(gc ShareableComponentBoilerplateWidgetModel.cs) -replace 'CompanyName.ShareableComponentBoilerplate.Kentico.MVC', '%Prefix%%ToolName%%PostFix%' | Out-File -encoding ASCII ShareableComponentBoilerplateWidgetModel.cs"
powershell -Command "(gc ShareableComponentBoilerplateWidgetModel.cs) -replace 'ShareableComponentBoilerplate', '%ToolName%' | Out-File -encoding ASCII ShareableComponentBoilerplateWidgetModel.cs"
rename ShareableComponentBoilerplateWidgetModel.cs %ToolName%WidgetModel.cs

powershell -Command "(gc ShareableComponentBoilerplate.csproj) -replace 'CompanyName.TShareableComponentBoilerplate.Kentico.MVC', '%Prefix%%ToolName%%PostFix%' | Out-File -encoding ASCII ShareableComponentBoilerplate.csproj"
powershell -Command "(gc ShareableComponentBoilerplate.csproj) -replace 'ShareableComponentBoilerplate', '%ToolName%' | Out-File -encoding ASCII ShareableComponentBoilerplate.csproj"
rename ShareableComponentBoilerplate.csproj %ToolName%.csproj

powershell -Command "(gc ShareableComponentBoilerplate.nuspec) -replace 'CompanyName.ShareableComponentBoilerplate', '%Prefix%%ToolName%' | Out-File -encoding ASCII ShareableComponentBoilerplate.nuspec"
powershell -Command "(gc ShareableComponentBoilerplate.nuspec) -replace '-TagsHere-', '%Tags%' | Out-File -encoding ASCII ShareableComponentBoilerplate.nuspec"
powershell -Command "(gc ShareableComponentBoilerplate.nuspec) -replace 'http://url', '%GitHubUrl%' | Out-File -encoding ASCII ShareableComponentBoilerplate.nuspec"
rename ShareableComponentBoilerplate.nuspec %ToolName%.nuspec

rename ShareableComponentBoilerplate.csproj.user %ToolName%.csproj.user
cd..

rename ShareableComponentBoilerplate %ToolName%

powershell -Command "(gc ShareableComponentBoilerplate.sln) -replace 'ShareableComponentBoilerplate', '%ToolName%' | Out-File -encoding ASCII ShareableComponentBoilerplate.sln"
rename ShareableComponentBoilerplate.sln %ToolName%.sln

cd targets
powershell -Command "(gc Kentico.EmbeddedViews.targets) -replace 'ShareableComponentBoilerplate', '%ToolName%' | Out-File -encoding ASCII Kentico.EmbeddedViews.targets"
cd..
