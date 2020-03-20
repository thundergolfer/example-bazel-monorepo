import React, { Component } from "react";
import ReactDOM from "react-dom";

interface ISnackbarProps {}

export default class Snackbar extends React.Component<ISnackbarProps> {
  private element = document.createElement("div");
  private modalRoot = document.body;
  constructor(props: ISnackbarProps) {
    super(props);
    this.element.className = "snackbar";
  }

  componentDidMount() {
    this.modalRoot.appendChild(this.element);
  }

  componentWillUnmount() {
    this.modalRoot.removeChild(this.element);
  }

  render() {
    return ReactDOM.createPortal(this.props.children, this.element);
  }
}
