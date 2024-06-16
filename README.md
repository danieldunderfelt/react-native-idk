# react-native-idk

React-Native Intelligence Development Kit is a toolkit for building AI-powered apps which leverage both local and cloud AI inference.

The following features are planned:

- [ ] **Local inference**: Run inference on the device using CoreML on iOS and (TBD) on Android.
- [ ] **Cloud inference**: Run inference on the cloud through an OpenAI compatible API (requires a custom server).
- [ ] **Seamlessly switch between local and cloud inference**: Define conditions to route requests between local and cloud inference, allow the user to switch between them, or have the IDK handle it for you.
- [ ] **Local LLM models**: Preload your app with any models which can be loaded into CoreML on iOS and (TBD) on Android (and is small enough to run on a mobile device), or allow your users to load their own models.
- [ ] **Prompt management**: Add and manage your own prompts.
- [ ] **Configuration management**: Configure the inference with your own parameters or use a preset.
- [ ] **Chat-style inference**: Inference the model with user/assistant messages.
- [ ] **Completion-style inference**: Inference the model with a single message and have it complete the rest.
- [ ] **Streaming**: Responses can be streamed to the user as they are generated.
- [ ] **Function calling and tool use**: Define tools and functions which can be called by the model.
- [ ] **Generative UI**: Generate the UI for your app.

## Installation

```sh
npm install react-native-idk
```

## Usage

TBD

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)


I want to run a good LLM locally in a React-native app. Starting with ios, what's the minimum implementation I need for running a coreml model in a react-native app? I am making this as a library, and I have all the scaffolding set up so please skip all React-native setup.

Do not suggest libraries. I want to know how to run CoreML models in the native iOS code. The users of my library will add the models they want to use to their React-native app, the library should not come with a model. All implementations should use Objective-C.
