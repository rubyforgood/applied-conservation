import React from 'react';

import Autocomplete from '../components/Autocomplete';
import {mount} from 'enzyme'


describe('Autocomplete', () => {
   const suggestions = ['suggestion 1', 'suggestion 2']

   it('displays suggestions when input clicked', () => {
       const autocomplete = mount(<Autocomplete suggestions={suggestions}/>)
       const input = autocomplete.find('input')
       input.simulate('focus')

       expect(autocomplete).to.have.text(suggestions[0])
   })
})
