import React from 'react';
import {Creatable} from 'react-select';
import 'react-select/dist/react-select.css';

export default class Autocomplete extends React.Component {
  constructor(props) {
    super(props)
    this.state = {selectedValue: props.value}
  }

  handleChange = (selectedOption) => {
    this.setState({selectedValue: selectedOption.value})
  }

  convertSuggestions = () => {
    return this.props.suggestions.map(suggestion =>
      ({ value: suggestion, label: suggestion})
    )
  }

  render() {
    const { selectedValue } = this.state
    const {name, id, className }= this.props
    return (
      <Creatable
        id={id}
        name={name}
        className={className}
        value={{value: selectedValue, label: selectedValue}}
        onChange={this.handleChange}
        options={this.convertSuggestions()}
        placeholder={'Select a suggestion or create your own...'}
      />
    );
  }
}
