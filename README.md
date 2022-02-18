<h1 align="center">
    📰 Billboard
</h1>
<p align="center">
<strong>Put text on your Mac status bar</strong>
</p>
<p align="center">
  <a href="https://github.com/daschaa/billboard/releases">
    <img src="https://img.shields.io/github/v/release/daschaa/billboard" alt="Current build" />
  </a>
  <a href="https://github.com/daschaa/billboard/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/daschaa/billboard" alt="Billboard is licensed under MIT" />
  </a>
</p>

This is a little app that allows to put an user-defined text to the status bar of a Mac (the one on top). It is built with Swift and React-Native and
is kind of a PoC that is possible to bind the status bar to an React-Native app. Further improvement ideas are totally welcome!

## 📸 Screenshot

![Showcase](assets/showcase.gif)

## 💻 Download

[The latest release can be downloaded here](https://github.com/daschaa/billboard/releases). Currently the app is not signed, but it is on the open task list.

## 👯 Contributing

Any contributions are highly welcomed. If you have any ideas, please create an issue before creating an pull-request. Thanks in advance ❤️

## 🧑🏼‍💻 Local Development

Feel free to checkout the repo and hack some stuff on your own! ❤️ To give you some advices in getting the code to run read
the following section.

### Prerequisites

- Node installed (preferably use [nvm](https://github.com/nvm-sh/nvm) to use different node version)
  - The code is usually run with v16.13 - [There is a strange bug when using v17](https://stackoverflow.com/questions/69647332/cannot-read-properties-of-undefined-reading-transformfile-at-bundler-transfo)
- XCode with CLI tools installed

### Commands to run
If everything is installed correctly, the app should start by simply run the install-and-run script.
```bash
# From the project root directory
./scripts/install-and-run.sh
```
#### 🚫 "Help! I ran into some issue!"
Arrrgh. I swear it runs on my machine 👀 But just open up an issue and we'll try to fix the issue together. Please try to provide as many details as you can.