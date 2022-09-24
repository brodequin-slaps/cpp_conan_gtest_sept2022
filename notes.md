# Using this template repo
1. Replace every YOUR_PROJECT_NAME instance with your project's name.
2. Make sure the `YOUR_PROJECT_NAME/build/Debug` and `YOUR_PROJECT_NAME/build/Release` are created if they are not
3. Go inside `.vscode` directory and change the directories for yours, and when adding new conan libraries, go there and add the dir path to get intellisense working
4. See the `commands.md` file

# why im using `script -qc`
https://stackoverflow.com/questions/3515208/can-colorized-output-be-captured-via-shell-redirect

it's because otherwise color isnt being redirected by subcommands therefore i lose the colors and impossible to see the errors so using this I can see the output in colors and see errors messages easier
