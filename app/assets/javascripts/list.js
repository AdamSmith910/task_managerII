$(document).ready(function () {
  $('#tasks-table').DataTable();
});

var markTaskComplete = function(listId, taskId) {
  $.ajax('/lists/' + listId + '/tasks/' + taskId + '.json', {
    method: 'PUT',
    success: hideTask(taskId),
    data: {
      task: {
        status: 'complete'
      }
    }
  });
};

var markTaskIncomplete = function(listId, taskId) {
  $.ajax('/lists/' + listId + '/tasks/' + taskId + '.json', {
    method: 'PUT',
    success: hideTask(taskId),
    data: {
      task: {
        status: 'incomplete'
      }
    }
  });
};

var markListArchived = function(listId) {
  $.ajax('/lists/' + listId + '.json', {
    method: 'PUT',
    success: hideList(listId),
    data: {
      list: {
        archived: true
      }
    }
  });
};

var markListUnarchived = function(listId) {
  $.ajax('/lists/' + listId + '.json', {
    method: 'PUT',
    success: hideList(listId),
    data: {
      list: {
        archived: true
      }
    }
  });
};

var hideTask = function(taskId) {
  $('#task-row-' + taskId).hide();
};