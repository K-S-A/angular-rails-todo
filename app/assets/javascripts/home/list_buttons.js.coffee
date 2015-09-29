angular.module('todoList').factory 'listButtons', [ ->
  o =
    buttons: [
      {
        buttons: [
          [
            'Expand All'
            'todosExpandAll(item)'
          ]
          [
            'Collapse All'
            'todosCollapseAll(item)'
          ]
          [
            'Select All'
            'selectAll(item)'
          ]
          [
            'Unselect All'
            'unselectAll(item)'
          ]
          [
            'Reverse Selection'
            'revSelection(item)'
          ]
        ]
        buttonStyle: 'btn btn-primary'
      }
      {
        buttons: [
          [
            'Destroy Selected'
            'destroySelected(item)'
          ]
          [
            'Change Status'
            'chStatus(item)'
          ]
          [
            'Remove Sorting'
            'orderList(null, item)'
          ]
        ]
        buttonStyle: 'btn btn-info'
      }
    ]
    sorting: [
      {
        name: 'title'
        col: '8'
        icon: 'glyphicon glyphicon-sort-by-alphabet'
      }
      {
        name: 'due_date'
        col: '2'
        icon: 'glyphicon glyphicon-sort-by-attributes'
      }
      {
        name: 'priority'
        col: '2'
        icon: 'glyphicon glyphicon-sort-by-order'
      }
    ]
  o
]
