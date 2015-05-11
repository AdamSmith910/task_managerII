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

var hideTask = function(taskId) {
  $('#task-row-' + taskId).hide();
};