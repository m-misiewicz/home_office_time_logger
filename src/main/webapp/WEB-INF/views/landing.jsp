<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Landing Page</title>
    <style>
        body {
                    font-family: Arial, sans-serif;
                    text-align: center;
                    margin: 20px;
                }
                h2 {
                    color: #333;
                }
                #timer-container {
                    display: flex;
                    justify-content: space-between;
                    margin-top: 20px;
                }
                #play-button, #stop-button {
                    padding: 10px 20px;
                    font-size: 16px;
                    cursor: pointer;
                }
                #play-button {
                    background-color: #4CAF50;
                    color: white;
                }
                #stop-button {
                    background-color: #f44336;
                    color: white;
                }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Placeholder for timer logic
            let timerRunning = false;

            // Placeholder for backend API URLs
            const startTimerUrl = '/api/start-timer';
            const stopTimerUrl = '/api/stop-timer';

            // Function to start the timer
            const startTimer = () => {
                // Send request to backend to start timer
                fetch(startTimerUrl, { method: 'POST' })
                    .then(response => {
                        if (response.ok) {
                            console.log('Timer started successfully');
                            timerRunning = true;
                        } else {
                            console.error('Failed to start timer');
                        }
                    })
                    .catch(error => console.error('Error starting timer:', error));
            };

            // Function to stop the timer and send email
            const stopTimer = () => {
                // Send request to backend to stop timer and send email
                fetch(stopTimerUrl, { method: 'POST' })
                    .then(response => {
                        if (response.ok) {
                            console.log('Timer stopped, and email sent successfully');
                            timerRunning = false;
                        } else {
                            console.error('Failed to stop timer and send email');
                        }
                    })
                    .catch(error => console.error('Error stopping timer and sending email:', error));
            };

            // Event listeners for the buttons
            document.getElementById('play-button').addEventListener('click', () => {
                if (!timerRunning) {
                    startTimer();
                }
            });

            document.getElementById('stop-button').addEventListener('click', () => {
                if (timerRunning) {
                    stopTimer();
                }
            });
        });
    </script>
</head>
<body>
    <h2>Welcome to the Landing Page</h2>
        <p>This is a simple landing page. You can customize it based on your needs.</p>

        <div id="timer-container">
            <button id="play-button">Play</button>
            <button id="stop-button">Stop</button>
        </div>
</body>
</html>