import 'dart:convert';

String form = json.encode({
    'title': 'Form name',
    'description': 'My Description',
    'autoValidated': true,
    'fields': [
      {
        'key': 'input1',
        'type': 'Input',
        'label': 'Hi Group',
        'placeholder': "Hi Group flutter",
        'value': 'defaultValue',
        'required': true
      },
      {
        'key': 'password1',
        'type': 'Password',
        'label': 'Password',
        'required': true
      },
      {
        'key': 'email1',
        'type': 'Email',
        'label': 'Email test',
        'placeholder': "hola a todos"
      },
      {
        'key': 'tareatext1',
        'type': 'TareaText',
        'label': 'TareaText test',
        'placeholder': "hola a todos"
      },
      {
        'key': 'radiobutton1',
        'type': 'RadioButton',
        'label': 'Radio Button tests',
        'value': 2,
        'items': [
          {
            'label': "product 1",
            'value': 1,
          },
          {
            'label': "product 2",
            'value': 2,
          },
          {
            'label': "product 3",
            'value': 3,
          }
        ]
      },
      {
        'key': 'switch1',
        'type': 'Switch',
        'label': 'Switch test',
        'value': false,
      },
      {
        'key': 'checkbox1',
        'type': 'Checkbox',
        'label': 'Checkbox test',
        'items': [
          {
            'label': "product 1",
            'value': true,
          },
          {
            'label': "product 2",
            'value': false,
          },
          {
            'label': "product 3",
            'value': false,
          }
        ]
      },
      {
        'key': 'select1',
        'type': 'Select',
        'label': 'Select test',
        'value': 'product 1',
        'items': [
          {
            'label': "product 1",
            'value': "product 1",
          },
          {
            'label': "product 2",
            'value': "product 2",
          },
          {
            'label': "product 3",
            'value': "product 3",
          }
        ]
      },
    ]
  });