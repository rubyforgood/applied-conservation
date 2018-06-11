def fill_in_autosuggest(label, with:)
  fill_in(label, with: with)
  find('.Select-create-option-placeholder').click
end