# Presentation Evaluation Application

## Overview

The **Presentation Evaluation Application** is a web application designed for managing audience feedback on presentations. It supports two main roles:

- **Instructor**: Can assign grades to presentations and view all feedback.
- **Student**: Can view the feedback for their own presentation and see their own grades.

This app provides a user-friendly process of collecting and organizing audience evaluations to aid in grading and providing constructive criticism to students.

## Features

- **Instructor Role**:
  - Create and manage presentation events.
  - Assign grades to presentations.
  - Delete any feedback or presentations.
  - View all feedback submitted by audience members.

- **Student Role**:
  - View feedback for their own presentation.
  - View their own grade.
  - Delete their own feedback and presentations. 

## Database Schema

The app uses the following schemas:

- **Feedback**: Stores audience feedback.
- **Presentation**: Contains details about each presentation.
- **Users**: Stores user data (instructors and students).
- **Grades**: Stores grades assigned by instructors.

## Dependencies

The application uses the following gems (see `Gemfile`):

- **rails**: Web framework.
- **sqlite3**: Database adapter.
- **puma**: Web server.
- **importmap-rails**: For JavaScript handling.
- **turbo-rails**: SPA-like page accelerator.
- **stimulus-rails**: Modest JavaScript framework.
- **bootstrap**: Frontend styling framework.
- **bcrypt**: User authentication via password hashing.
- **sassc-rails**: For SCSS styling.

To install dependencies, run:

```bash
bundle install
```

Run on local host.
