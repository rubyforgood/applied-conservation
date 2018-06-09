import React from 'react';
import {Creatable} from 'react-select';
import 'react-select/dist/react-select.css';

export default class Autocomplete extends React.Component {
  state = {
    selectedOption: '',
  }

  handleChange = (selectedOption) => {
    this.setState({ selectedOption });
    // selectedOption can be null when the `x` (close) button is clicked
    if (selectedOption) {
      console.log(`Selected: ${selectedOption.label}`);
    }
  }
  render() {
    const { selectedOption } = this.state
    const {suggestions, name, id}= this.props
    return (
      <Creatable
        id={id}
        name={name}
        value={selectedOption}
        onChange={this.handleChange}
        options={suggestions.map(suggestion => ({label: suggestion, value: suggestion}))}
      />
    );
  }
}
