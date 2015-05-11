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

var hideTask = function(taskId) {
  $('#task-row-' + taskId).hide();
};