//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;

contract TodoList {
    uint public taskCount = 0;

    struct Task {
        uint id;
        string content;
        bool completed;
    }

    mapping(uint => Task) public tasks;

    event TaskCreated(uint id, string content, bool completed);
    event TaskCompleted(uint id, bool completed);

    constructor() {
        createTask("Check out dappuniv");
    }

    // Method to create a new task
    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
        emit TaskCreated(taskCount, _content, false);
    }

    // Method to update the state of a task identifiedby his id
    function toggleCompleted(uint id) public {
        Task memory _task = tasks[id];
        _task.completed = !_task.completed;
        tasks[id] = _task;
        emit TaskCompleted(id, _task.completed);
    }
}