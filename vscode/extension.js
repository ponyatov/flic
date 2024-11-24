const vscode = require('vscode');

function hello() {  //
    vscode.window.showInformationMessage('flic/hello');
}

async function activate(context) {
    // console.log(activate, context);
    // vscode.window.showInformationMessage('flic/activate');
    //
    context.subscriptions.push(
        vscode.commands.registerCommand('dponyatov.flic.hello', hello));
    //
    // context.subscriptions.push(
    //     vscode.commands.registerCommand('dponyatov.flic.install', () => {
    //         vscode.commands.executeCommand('cmake.install');
    //     }));
    // //
    // vscode.commands.executeCommand('dponyatov.flic.install');
}

function deactivate() {
    // console.log(deactivate);
    // vscode.window.showInformationMessage('flic/deactivate');
}

module.exports = {
    activate,
    deactivate,
    hello
}
