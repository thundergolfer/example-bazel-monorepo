import React, { Component } from "react";

interface IGreetingProps {
  msg?: string;
}

export default class Greeting extends Component<IGreetingProps> {
  render() {
    return (
      <div className="greeting">
        hello,
        <span className="name">{this.props.msg || "bazel"}</span> !
      </div>
    );
  }
}
