const vscode = require('vscode');

function hello() {
    vscode.window.showInformationMessage('flic/hello');
}

function repl() {
    vscode.window.showInformationMessage('flic/repl');
}

async function activate(context) {
    console.log(activate, context);
    let hello = vscode.commands.registerCommand('flic.hello', hello);
    context.subscriptions.push(hello);
    let repl = vscode.commands.registerCommand('flic.repl', repl);
    context.subscriptions.push(repl);
}

function deactivate() {
    console.log(deactivate);
}

module.exports = {
    activate,
    deactivate,
    hello,repl
}
