// currently third party packages from npm are not available due to issue:
// https://github.com/bazelbuild/rules_typescript/issues/103
// import {sample} from 'lodash';

import React from "react";
import ReactDOM from "react-dom";

import SnackbarDemo from "./components/Snackbar/Snackbar";

interface IAppState {
  showToast: boolean;
}
class App extends React.Component<{}, IAppState> {
  constructor(props: {}) {
    super(props);
    this.state = {
      showToast: false
    };
  }

  render() {
    return (
      <div>
        <SnackbarDemo>msg from snackbar</SnackbarDemo>
      </div>
    );
  }
}

export default () => {
  ReactDOM.render(<App />, document.querySelector("#app"));
};
