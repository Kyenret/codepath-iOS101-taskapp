# Project 7 - *Task App*

Submitted by: **Kyenret Yakubu Ayuba**

**Task App** is an application that employs UserDefaults to store and maintain task data in local storage while also implementing tab bar navigation to enable users to efficiently manage tasks through the main tasks list and a calendar.

Time spent: **5** hours spent in total

## Required Features

The following **required** functionality is completed:

- [x] App displays a list of tasks
- [x] Users can add tasks to the list
- [x] Session persists when application is closed and relaunched (tasks dont get deleted when closing app) 
  - [x] Note: You have to quit the app, not minimize it, in order to see the persistence.
- [x] Tasks can be deleted
- [x] Users have a calendar view via navigation controller that displays tasks    


The following **additional** features are implemented:

- [x] Tasks can be toggled completed
- [x] User can edit tasks by tapping on the task in the feed view
- [ ] List anything else that you can get done to improve the app functionality!

## Video Walkthrough

<div>
    <a href="https://www.loom.com/share/0ce702eb6f554531adba184d4c103a66">
      <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/0ce702eb6f554531adba184d4c103a66-with-play.gif">
    </a>

## Notes

I encountered an error within the TaskViewController file in the code section for enabling the "swipe to delete" functionality, initially passing an array of [Task] to the "Task.save(_)" method instead of the expected single Task object, which I resolved by adding "forKey: Task.saveKey." Additionally, I faced an issue where marking a task as complete would result in duplicate tasks, one marked complete and the other not, which I resolved by introducing an ID within the Task constructor to prevent the creation of a new ID every time an encoded task is decoded when retrieving values from UserDefaults.
           

## License

    Copyright [2023] [Kyenret Yakubu Ayuba]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
