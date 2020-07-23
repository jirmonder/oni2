open EditorCoreTypes;
open Oni_Core;

type model;

let initial: model;

[@deriving show]
type msg;

module Msg: {
  let exthost: Exthost.Msg.LanguageFeatures.msg => msg;
  let keyPressed: string => msg;
  let pasted: string => msg;
};

type outmsg;

let update: (msg, model) => (model, outmsg);

let isFocused: model => bool;

let sub:
  (~visibleBuffers: list(Oni_Core.Buffer.t), ~client: Exthost.Client.t) =>
  Isolinear.Sub.t(msg);

module Contributions: {
  let commands: list(Command.t(msg));
  let contextKeys: WhenExpr.ContextKeys.Schema.t(model);
  let keybindings: list(Oni_Input.Keybindings.keybinding);
};

module Definition: {
  
  let getAt: (~bufferId: int, ~location: Location.t, model) => option(
    Exthost.DefinitionLink.t
  );

  let isAvailable: (~bufferId: int, ~location: Location.t, model) => bool;
};

// TODO: Remove
module Completions = Completions;
module CompletionItem = CompletionItem;
module CompletionMeet = CompletionMeet;
module Diagnostic = Diagnostic;
module Diagnostics = Diagnostics;
module LanguageFeatures = LanguageFeatures;