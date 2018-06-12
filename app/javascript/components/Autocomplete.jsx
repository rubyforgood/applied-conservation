import React from 'react';
import {Creatable} from 'react-select';
import 'react-select/dist/react-select.css';

export default class Autocomplete extends React.Component {
  state = {
    selectedOption: {
      value: this.props.value,
      label: this.props.suggestions[this.props.value] || this.props.value,
    },
  }

  handleChange = (selectedOption) => {
    this.setState({ selectedOption });
  }

  convertSuggestions = () => {
    const {suggestions} = this.props

    return Object.keys(suggestions).map(suggestion =>
      ({ value: suggestion, label: suggestions[suggestion]})
    )
  }

  render() {
    const { selectedOption } = this.state
    const { suggestions, name, id, className }= this.props
    return (
      <Creatable
        id={id}
        name={name}
        className={className}
        value={selectedOption}
        onChange={this.handleChange}
        options={this.convertSuggestions()}
      />
    );
  }
}
