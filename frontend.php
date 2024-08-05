<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My SQL Queries</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            max-width: 800px;
            margin: 0 auto;
            padding: 2rem;
            
            background-color: #333;
            color: #fff;
        }

        .query-results {
            margin-top: 2rem;
        }

        pre {
            background-color: #444;
            padding: 1rem;
            border-radius: 5px;
            overflow-x: auto;
            margin-top: 1rem;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
        }

        th, td {
            border: 1px solid #777;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #666;
            color: #fff;
        }
    </style>
</head>
<body>

<h1>My SQL Queries</h1>

<div class="query-results">
    
    <?php
    $servername = "localhost";
    $username = "root";
    $password = "root";
    $dbname = "smartwatch_";

    // create and assign connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    
    // check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Question 1
    $sql1 = "SELECT e.Difficulty,
u.Gender,
ROUND(AVG(sc.StepCount)) AS AverageSteps
FROM StepCount sc
JOIN Exercises e ON sc.ExerciseID = e.ExerciseID
JOIN UserExercise ue ON sc.ExerciseID = ue.ExerciseID
JOIN Users u ON ue.UserID = u.UserID
GROUP BY e.Difficulty, u.Gender
ORDER BY e.Difficulty, u.Gender;"; 
    $result1 = $conn->query($sql1);
    //Headers and Query Block
    echo "<h2>Question 1: What is the average number of steps taken by users for each exercise difficulty level, and how does it vary based on gender?</h2>";
    echo "<pre><code>";
    echo $sql1;
    echo "</pre></code>";
    // Output data of query 1
    if ($result1) {
        if ($result1->num_rows > 0) {
            echo "<pre><code>";    
            // Output table header
            echo "<table><tr>";
            while ($column = $result1->fetch_field()) {
                echo "<th>" . $column->name . "</th>";
            }
            echo "</tr>";

            // Output data rows
            while($row = $result1->fetch_assoc()) {
                echo "<tr>";
                foreach($row as $value) {
                    echo "<td>" . $value . "</td>";
                }
                echo "</tr>";
            }
            echo "</table></code></pre>";
        } else {
            echo "<pre><code>";
            echo "<p>0 results</p>";
            echo "</code></pre>";
        }
    } else {
        echo "<p>Error executing Query 1: " . $conn->error . "</p>";
    }

    // Question 2
    $sql2 = "WITH GenderExerciseCounts AS (
SELECT u.Gender,
et.ExerciseCategory,
COUNT(ue.UserExerciseID) AS ExerciseCount
FROM Users u
JOIN UserExercise ue ON u.UserID = ue.UserID
JOIN Exercises e ON ue.ExerciseID = e.ExerciseID
JOIN ExerciseType et ON e.ExerciseTypeID = et.ExerciseTypeID
GROUP BY u.Gender, et.ExerciseCategory),
MaxExerciseCounts AS (
SELECT Gender,
ExerciseCategory,
ExerciseCount,
ROW_NUMBER() OVER(PARTITION BY Gender ORDER BY ExerciseCount DESC) AS rn
FROM GenderExerciseCounts
)
SELECT Gender,
ExerciseCategory,
ExerciseCount
FROM MaxExerciseCounts
WHERE rn = 1;"; 
    $result2 = $conn->query($sql2);
    //Headers and Query Block
    echo "<h2>Question 2: What is the distribution of exercise categories among male and female users, and which category is the most popular for each gender?</h2>";
    echo "<pre><code>";
    echo $sql2;
    echo "</pre></code>";
    // Output data of query 2
    if ($result2) {
        if ($result2->num_rows > 0) {
            echo "<pre><code>";
            // Output table header
            echo "<table><tr>";
            while ($column = $result2->fetch_field()) {
                echo "<th>" . $column->name . "</th>";
            }
            echo "</tr>";

            // Output data rows
            while($row = $result2->fetch_assoc()) {
                echo "<tr>";
                foreach($row as $value) {
                    echo "<td>" . $value . "</td>";
                }
                echo "</tr>";
            }
            echo "</table></code></pre>";
        } else {
            echo "<pre><code>";
            echo "<p>0 results</p>";
            echo "</code></pre>";
        }
    } else {
        echo "<p>Error executing Query 2: " . $conn->error . "</p>";
    }
    // Question 3
    $sql2 = "SELECT UserID, COUNT(*) AS ExerciseSessions
    FROM UserExercise
    GROUP BY UserID
    ORDER BY ExerciseSessions DESC
    LIMIT 10;
    ";  
    $result2 = $conn->query($sql2);
    //Headers and Query Block
    echo "<h2>Question 3: What are the top 10 users with the highest number of logged exercise sessions?</h2>";
    echo "<pre><code>";
    echo "SELECT UserID, COUNT(*) AS ExerciseSessions
FROM UserExercise
GROUP BY UserID
ORDER BY ExerciseSessions DESC
LIMIT 10;";
    echo "</pre></code>";
    // Output data of query 
    if ($result2) {
        if ($result2->num_rows > 0) {
            echo "<pre><code>";
            // Output table header
            echo "<table><tr>";
            while ($column = $result2->fetch_field()) {
                echo "<th>" . $column->name . "</th>";
            }
            echo "</tr>";

            // Output data rows
            while($row = $result2->fetch_assoc()) {
                echo "<tr>";
                foreach($row as $value) {
                    echo "<td>" . $value . "</td>";
                }
                echo "</tr>";
            }
            echo "</table></code></pre>";
        } else {
            echo "<pre><code>";
            echo "<p>0 results</p>";
            echo "</code></pre>";
        }
    } else {
        echo "<p>Error executing Query : " . $conn->error . "</p>";
    }

    // Question 4
    $sql2 = "SELECT CategoryName, COUNT(*) AS TotalBadgesUnlocked
    FROM BadgesUnlocked bu
    INNER JOIN Badges b ON bu.BadgesID = b.BadgeID
    GROUP BY CategoryName;
    "; 
    $result2 = $conn->query($sql2);
    //Headers and Query Block
    echo "<h2>Question 4: How many badges of each category have been unlocked by users?</h2>";
    echo "<pre><code>";
    echo "SELECT CategoryName, COUNT(*) AS TotalBadgesUnlocked
FROM BadgesUnlocked bu
INNER JOIN Badges b ON bu.BadgesID = b.BadgeID
GROUP BY CategoryName;";
    echo "</pre></code>";
    // Output data of query 
    if ($result2) {
        if ($result2->num_rows > 0) {
            echo "<pre><code>";
            // Output table header
            echo "<table><tr>";
            while ($column = $result2->fetch_field()) {
                echo "<th>" . $column->name . "</th>";
            }
            echo "</tr>";

            // Output data rows
            while($row = $result2->fetch_assoc()) {
                echo "<tr>";
                foreach($row as $value) {
                    echo "<td>" . $value . "</td>";
                }
                echo "</tr>";
            }
            echo "</table></code></pre>";
        } else {
            echo "<pre><code>";
            echo "<p>0 results</p>";
            echo "</code></pre>";
        }
    } else {
        echo "<p>Error executing Query : " . $conn->error . "</p>";
    }

    // Question 5
    $sql2 = "SELECT AVG(hr.HeartRateValue) AS AverageHeartRate
FROM HeartRate hr
JOIN UserExercise ue ON hr.UserExerciseID = ue.UserExerciseID
JOIN Users u ON ue.UserID = u.UserID
WHERE u.Gender = 'male'
AND u.Birthday BETWEEN DATE_SUB(CURDATE(), INTERVAL 35 YEAR) AND DATE_SUB(CURDATE(), INTERVAL 25 YEAR);"; 
    $result2 = $conn->query($sql2);
    //Headers and Query Block
    echo "<h2>Question 5: What is the average heart rate recorded during exercise sessions for male users aged between 25 and 35?</h2>";
    echo "<pre><code>";
    echo $sql2;
    echo "</pre></code>";
    // Output data of query 
    if ($result2) {
        if ($result2->num_rows > 0) {
            echo "<pre><code>";
            // Output table header
            echo "<table><tr>";
            while ($column = $result2->fetch_field()) {
                echo "<th>" . $column->name . "</th>";
            }
            echo "</tr>";

            // Output data rows
            while($row = $result2->fetch_assoc()) {
                echo "<tr>";
                foreach($row as $value) {
                    echo "<td>" . $value . "</td>";
                }
                echo "</tr>";
            }
            echo "</table></code></pre>";
        } else {
            echo "<pre><code>";
            echo "<p>0 results</p>";
            echo "</code></pre>";
        }
    } else {
        echo "<p>Error executing Query : " . $conn->error . "</p>";
    }
    // Question 6
    $sql2 = "SELECT SUM(CalorieBurnt) AS TotalCaloriesBurnt
    FROM UserExercise UE
    JOIN Exercises E ON UE.ExerciseID = E.ExerciseID
    WHERE E.Difficulty = 'hard';"; 
    $result2 = $conn->query($sql2);
    //Headers and Query Block
    echo "<h2>Question 6: How many calories were burnt in total during exercise sessions categorized as 'hard' difficulty?</h2>";
    echo "<pre><code>";
    echo "SELECT SUM(cc.CalorieBurnt) AS TotalCaloriesBurnt
FROM UserExercise ue
INNER JOIN CalorieCounter cc ON ue.CounterID = cc.CounterID
INNER JOIN Exercises e ON ue.ExerciseID = e.ExerciseID
WHERE e.Difficulty = 'hard';";
    echo "</pre></code>";
    // Output data of query 
    if ($result2) {
        if ($result2->num_rows > 0) {
            echo "<pre><code>";
            // Output table header
            echo "<table><tr>";
            while ($column = $result2->fetch_field()) {
                echo "<th>" . $column->name . "</th>";
            }
            echo "</tr>";

            // Output data rows
            while($row = $result2->fetch_assoc()) {
                echo "<tr>";
                foreach($row as $value) {
                    echo "<td>" . $value . "</td>";
                }
                echo "</tr>";
            }
            echo "</table></code></pre>";
        } else {
            echo "<pre><code>";
            echo "<p>0 results</p>";
            echo "</code></pre>";
        }
    } else {
        echo "<p>Error executing Query : " . $conn->error . "</p>";
    }
    // Question 7
    $sql2 = "SELECT et.ExerciseCategory, AVG(ue.DistanceTravelled) AS AverageDistance
    FROM UserExercise ue
    INNER JOIN Exercises e ON ue.ExerciseID = e.ExerciseID
    INNER JOIN ExerciseType et ON e.ExerciseTypeID = et.ExerciseTypeID
    GROUP BY et.ExerciseCategory
    ORDER BY AverageDistance DESC;

    "; 
    $result2 = $conn->query($sql2);
    //Headers and Query Block
    echo "<h2>Question 7: Which exercise types have the highest average distance traveled by users?</h2>";
    echo "<pre><code>";
    echo "SELECT et.ExerciseCategory, AVG(ue.DistanceTravelled) AS AverageDistance
FROM UserExercise ue
INNER JOIN Exercises e ON ue.ExerciseID = e.ExerciseID
INNER JOIN ExerciseType et ON e.ExerciseTypeID = et.ExerciseTypeID
GROUP BY et.ExerciseCategory
ORDER BY AverageDistance DESC;";
    echo "</pre></code>";
    // Output data of query 
    if ($result2) {
        if ($result2->num_rows > 0) {
            echo "<pre><code>";
            // Output table header
            echo "<table><tr>";
            while ($column = $result2->fetch_field()) {
                echo "<th>" . $column->name . "</th>";
            }
            echo "</tr>";

            // Output data rows
            while($row = $result2->fetch_assoc()) {
                echo "<tr>";
                foreach($row as $value) {
                    echo "<td>" . $value . "</td>";
                }
                echo "</tr>";
            }
            echo "</table></code></pre>";
        } else {
            echo "<pre><code>";
            echo "<p>0 results</p>";
            echo "</code></pre>";
        }
    } else {
        echo "<p>Error executing Query : " . $conn->error . "</p>";
    }
    // Question 8
    $sql2 = "SELECT MenuName,
COUNT(*) AS Frequency,
SEC_TO_TIME(SUM(TIME_TO_SEC(Duration))) AS TotalDuration
FROM MenuAccessed
GROUP BY MenuName
ORDER BY Frequency DESC, TotalDuration DESC
LIMIT 3;"; 
    $result2 = $conn->query($sql2);
    //Headers and Query Block
    echo "<h2>Question 8: What are the top three most commonly accessed menu activities by users in terms of frequency and duration?</h2>";
    echo "<pre><code>";
    echo $sql2;
    echo "</pre></code>";
    // Output data of query 
    if ($result2) {
        if ($result2->num_rows > 0) {
            echo "<pre><code>";
            // Output table header
            echo "<table><tr>";
            while ($column = $result2->fetch_field()) {
                echo "<th>" . $column->name . "</th>";
            }
            echo "</tr>";

            // Output data rows
            while($row = $result2->fetch_assoc()) {
                echo "<tr>";
                foreach($row as $value) {
                    echo "<td>" . $value . "</td>";
                }
                echo "</tr>";
            }
            echo "</table></code></pre>";
        } else {
            echo "<pre><code>";
            echo "<p>0 results</p>";
            echo "</code></pre>";
        }
    } else {
        echo "<p>Error executing Query : " . $conn->error . "</p>";
    }

    // Question 9
    $sql2 = "SELECT COUNT(DISTINCT ue.UserID) AS Frequency
FROM UserExercise ue
INNER JOIN Sleep s ON ue.UserExerciseID = s.UserExerciseID
INNER JOIN BloodOxygenLevel bol ON ue.OxygenLevelID = bol.OxygenLevelID
WHERE bol.OxygenSaturationLevel = 99;"; 
    $result2 = $conn->query($sql2);
    //Headers and Query Block
    echo "<h2>Question 9: What is the frequency of users that have oxygen saturation level at 99% while sleeping.</h2>";
    echo "<pre><code>";
    echo $sql2;
    echo "</pre></code>";
    // Output data of query 
    if ($result2) {
        if ($result2->num_rows > 0) {
            echo "<pre><code>";
            // Output table header
            echo "<table><tr>";
            while ($column = $result2->fetch_field()) {
                echo "<th>" . $column->name . "</th>";
            }
            echo "</tr>";

            // Output data rows
            while($row = $result2->fetch_assoc()) {
                echo "<tr>";
                foreach($row as $value) {
                    echo "<td>" . $value . "</td>";
                }
                echo "</tr>";
            }
            echo "</table></code></pre>";
        } else {
            echo "<pre><code>";
            echo "<p>0 results</p>";
            echo "</code></pre>";
        }
    } else {
        echo "<p>Error executing Query : " . $conn->error . "</p>";
    }

    // Question 10
    $sql2 = "WITH CalorieBurntByDifficulty AS (
SELECT u.Gender,
e.Difficulty,
AVG(ue.CalorieBurnt) AS AvgCaloriesBurnt
FROM UserExercise ue
JOIN Users u ON ue.UserID = u.UserID
JOIN Exercises e ON ue.ExerciseID = e.ExerciseID
GROUP BY u.Gender, e.Difficulty
)
SELECT Gender,
Difficulty,
AVG(AvgCaloriesBurnt) AS AverageCaloriesBurnt
FROM CalorieBurntByDifficulty
GROUP BY Gender, Difficulty
ORDER BY Gender, Difficulty;"; 
    $result2 = $conn->query($sql2);
    //Headers and Query Block
    echo "<h2>Question 10: How does the average calorie burnt during exercise sessions vary based on the user's preferred exercise difficulty level, and does this difference differ between male and female users?</h2>";
    echo "<pre><code>";
    echo $sql2;
    echo "</pre></code>";
    // Output data of query 
    if ($result2) {
        if ($result2->num_rows > 0) {
            echo "<pre><code>";
            // Output table header
            echo "<table><tr>";
            while ($column = $result2->fetch_field()) {
                echo "<th>" . $column->name . "</th>";
            }
            echo "</tr>";

            // Output data rows
            while($row = $result2->fetch_assoc()) {
                echo "<tr>";
                foreach($row as $value) {
                    echo "<td>" . $value . "</td>";
                }
                echo "</tr>";
            }
            echo "</table></code></pre>";
        } else {
            echo "<pre><code>";
            echo "<p>0 results</p>";
            echo "</code></pre>";
        }
    } else {
        echo "<p>Error executing Query : " . $conn->error . "</p>";
    }

    // Question 11
    $sql2 = "SELECT
AVG(TIMESTAMPDIFF(MINUTE, s.TimeWindow, ue.EndTime)) AS AvgSleepDurationinMinutes
FROM
Sleep s
JOIN
UserExercise ue ON s.UserExerciseID = ue.UserExerciseID
JOIN
Users u ON ue.UserID = u.UserID
JOIN
UserPreference up ON u.UserID = up.UserID
JOIN
WatchFace wf ON up.WatchfaceID = wf.WatchfaceID
WHERE
wf.WatchfaceColour = 'green';"; 
    $result2 = $conn->query($sql2);
    //Headers and Query Block
    echo "<h2>Question 11: What is the average duration of sleep for users who prefer green-colored watch faces?</h2>";
    echo "<pre><code>";
    echo $sql2;
    echo "</pre></code>";
    // Output data of query 
    if ($result2) {
        if ($result2->num_rows > 0) {
            echo "<pre><code>";
            // Output table header
            echo "<table><tr>";
            while ($column = $result2->fetch_field()) {
                echo "<th>" . $column->name . "</th>";
            }
            echo "</tr>";

            // Output data rows
            while($row = $result2->fetch_assoc()) {
                echo "<tr>";
                foreach($row as $value) {
                    echo "<td>" . $value . "</td>";
                }
                echo "</tr>";
            }
            echo "</table></code></pre>";
        } else {
            echo "<pre><code>";
            echo "<p>0 results</p>";
            echo "</code></pre>";
        }
    } else {
        echo "<p>Error executing Query : " . $conn->error . "</p>";
    }

    // Question 12
    $sql2 = "WITH StepCounts AS (
SELECT u.Gender,
YEAR(ue.StartTime) AS Year,
MONTH(ue.StartTime) AS Month,
SUM(sc.StepCount) AS TotalSteps
FROM UserExercise ue
JOIN Users u ON ue.UserID = u.UserID
LEFT JOIN StepCount sc ON ue.ExerciseID = sc.ExerciseID
GROUP BY u.Gender, Year, Month
)
SELECT Gender,
Year,
Month,
AVG(TotalSteps) AS AvgSteps
FROM StepCounts
GROUP BY Gender, Year, Month
ORDER BY Gender, Year, Month;"; 
    $result2 = $conn->query($sql2);
    //Headers and Query Block
    echo "<h2>Question 12: What is the trend of the average number of steps taken by users during exercise sessions over time, and how does this trend differ between male and female users?</h2>";
    echo "<pre><code>";
    echo $sql2;
    echo "</pre></code>";
    // Output data of query 
    if ($result2) {
        if ($result2->num_rows > 0) {
            echo "<pre><code>";
            // Output table header
            echo "<table><tr>";
            while ($column = $result2->fetch_field()) {
                echo "<th>" . $column->name . "</th>";
            }
            echo "</tr>";

            // Output data rows
            while($row = $result2->fetch_assoc()) {
                echo "<tr>";
                foreach($row as $value) {
                    echo "<td>" . $value . "</td>";
                }
                echo "</tr>";
            }
            echo "</table></code></pre>";
        } else {
            echo "<pre><code>";
            echo "<p>0 results</p>";
            echo "</code></pre>";
        }
    } else {
        echo "<p>Error executing Query : " . $conn->error . "</p>";
    }

    // Question 13
    $sql2 = "SELECT BadgeID, BadgeName, COUNT(*) AS UnlockCount
FROM BadgesUnlocked
JOIN Badges ON BadgesUnlocked.BadgesID = Badges.BadgeID
GROUP BY BadgeID, BadgeName
ORDER BY UnlockCount DESC
LIMIT 5;"; 
    $result2 = $conn->query($sql2);
    //Headers and Query Block
    echo "<h2>Question 13: What are the top 5 most commonly unlocked badges?</h2>";
    echo "<pre><code>";
    echo $sql2;
    echo "</pre></code>";
    // Output data of query 
    if ($result2) {
        if ($result2->num_rows > 0) {
            echo "<pre><code>";
            // Output table header
            echo "<table><tr>";
            while ($column = $result2->fetch_field()) {
                echo "<th>" . $column->name . "</th>";
            }
            echo "</tr>";

            // Output data rows
            while($row = $result2->fetch_assoc()) {
                echo "<tr>";
                foreach($row as $value) {
                    echo "<td>" . $value . "</td>";
                }
                echo "</tr>";
            }
            echo "</table></code></pre>";
        } else {
            echo "<pre><code>";
            echo "<p>0 results</p>";
            echo "</code></pre>";
        }
    } else {
        echo "<p>Error executing Query : " . $conn->error . "</p>";
    }

    // Question 14
    $sql2 = "SELECT COUNT(*) AS ExerciseSessionsRecorded
FROM UserExercise ue
JOIN Users u ON ue.UserID = u.UserID
WHERE u.Height > 180;"; 
    $result2 = $conn->query($sql2);
    //Headers and Query Block
    echo "<h2>Question 14: How many exercise sessions were recorded for users with a height above 180 cm?</h2>";
    echo "<pre><code>";
    echo $sql2;
    echo "</pre></code>";
    // Output data of query 
    if ($result2) {
        if ($result2->num_rows > 0) {
            echo "<pre><code>";
            // Output table header
            echo "<table><tr>";
            while ($column = $result2->fetch_field()) {
                echo "<th>" . $column->name . "</th>";
            }
            echo "</tr>";

            // Output data rows
            while($row = $result2->fetch_assoc()) {
                echo "<tr>";
                foreach($row as $value) {
                    echo "<td>" . $value . "</td>";
                }
                echo "</tr>";
            }
            echo "</table></code></pre>";
        } else {
            echo "<pre><code>";
            echo "<p>0 results</p>";
            echo "</code></pre>";
        }
    } else {
        echo "<p>Error executing Query : " . $conn->error . "</p>";
    }

    // Question 15
    $sql2 = "SELECT AVG(hr.HeartRateValue) AS AverageHeartRate
FROM HeartRate hr
JOIN UserExercise ue ON hr.UserExerciseID = ue.UserExerciseID
JOIN UserHistory uh ON ue.UserID = uh.UserID
WHERE uh.LastLoginDate >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);"; 
    $result2 = $conn->query($sql2);
    //Headers and Query Block
    echo "<h2>Question 15: What is the average heart rate during exercise sessions for users who logged in at least once in the last month?</h2>";
    echo "<pre><code>";
    echo $sql2;
    echo "</pre></code>";
    // Output data of query 
    if ($result2) {
        if ($result2->num_rows > 0) {
            echo "<pre><code>";
            // Output table header
            echo "<table><tr>";
            while ($column = $result2->fetch_field()) {
                echo "<th>" . $column->name . "</th>";
            }
            echo "</tr>";

            // Output data rows
            while($row = $result2->fetch_assoc()) {
                echo "<tr>";
                foreach($row as $value) {
                    echo "<td>" . $value . "</td>";
                }
                echo "</tr>";
            }
            echo "</table></code></pre>";
        } else {
            echo "<pre><code>";
            echo "<p>0 results</p>";
            echo "</code></pre>";
        }
    } else {
        echo "<p>Error executing Query : " . $conn->error . "</p>";
    }

    // Question 16
    $sql2 = "WITH DifficultyDistribution AS (
SELECT u.Gender,
e.Difficulty,
COUNT(ma.MenuActivityID) AS MenuAccessFrequency
FROM MenuAccessed ma
JOIN Users u ON ma.UserID = u.UserID
JOIN UserExercise ue ON ma.UserID = ue.UserID
JOIN Exercises e ON ue.ExerciseID = e.ExerciseID
GROUP BY u.Gender, e.Difficulty
)
SELECT Gender,
Difficulty,
MenuAccessFrequency
FROM DifficultyDistribution
ORDER BY Gender, Difficulty;"; 
    $result2 = $conn->query($sql2);
    //Headers and Query Block
    echo "<h2>Question 16: How does the distribution of exercise difficulty levels correlate with the frequency of menu accesses by users, and what is the difference in this correlation between male and female users?</h2>";
    echo "<pre><code>";
    echo $sql2;
    echo "</pre></code>";
    // Output data of query 
    if ($result2) {
        if ($result2->num_rows > 0) {
            echo "<pre><code>";
            // Output table header
            echo "<table><tr>";
            while ($column = $result2->fetch_field()) {
                echo "<th>" . $column->name . "</th>";
            }
            echo "</tr>";

            // Output data rows
            while($row = $result2->fetch_assoc()) {
                echo "<tr>";
                foreach($row as $value) {
                    echo "<td>" . $value . "</td>";
                }
                echo "</tr>";
            }
            echo "</table></code></pre>";
        } else {
            echo "<pre><code>";
            echo "<p>0 results</p>";
            echo "</code></pre>";
        }
    } else {
        echo "<p>Error executing Query : " . $conn->error . "</p>";
    }

    // Question 17
    $sql2 = "SELECT et.ExerciseCategory, AVG(hr.HeartRateValue) AS AverageHeartRate
FROM HeartRate hr
JOIN UserExercise ue ON hr.UserExerciseID = ue.UserExerciseID
JOIN Exercises ex ON ue.ExerciseID = ex.ExerciseID
JOIN ExerciseType et ON ex.ExerciseTypeID = et.ExerciseTypeID
GROUP BY et.ExerciseCategory;"; 
    $result2 = $conn->query($sql2);
    //Headers and Query Block
    echo "<h2>Question 17: What is the average heart rate during different exercise types?</h2>";
    echo "<pre><code>";
    echo $sql2;
    echo "</pre></code>";
    // Output data of query 
    if ($result2) {
        if ($result2->num_rows > 0) {
            echo "<pre><code>";
            // Output table header
            echo "<table><tr>";
            while ($column = $result2->fetch_field()) {
                echo "<th>" . $column->name . "</th>";
            }
            echo "</tr>";

            // Output data rows
            while($row = $result2->fetch_assoc()) {
                echo "<tr>";
                foreach($row as $value) {
                    echo "<td>" . $value . "</td>";
                }
                echo "</tr>";
            }
            echo "</table></code></pre>";
        } else {
            echo "<pre><code>";
            echo "<p>0 results</p>";
            echo "</code></pre>";
        }
    } else {
        echo "<p>Error executing Query : " . $conn->error . "</p>";
    }

    // Question 18
    $sql2 = "SELECT COUNT(DISTINCT hr.UserID) AS NumberOfUsers
FROM HeartRate hr
LEFT JOIN UserExercise ue ON hr.UserExerciseID = ue.UserExerciseID
WHERE (hr.UserExerciseID IS NULL 
OR (hr.TimeStamp < ue.StartTime OR hr.TimeStamp > ue.EndTime));"; 
    $result2 = $conn->query($sql2);
    //Headers and Query Block
    echo "<h2>Question 18: How many users have manually triggered heart rate measurements?</h2>";
    echo "<pre><code>";
    echo $sql2;
    echo "</pre></code>";
    // Output data of query 
    if ($result2) {
        if ($result2->num_rows > 0) {
            echo "<pre><code>";
            // Output table header
            echo "<table><tr>";
            while ($column = $result2->fetch_field()) {
                echo "<th>" . $column->name . "</th>";
            }
            echo "</tr>";

            // Output data rows
            while($row = $result2->fetch_assoc()) {
                echo "<tr>";
                foreach($row as $value) {
                    echo "<td>" . $value . "</td>";
                }
                echo "</tr>";
            }
            echo "</table></code></pre>";
        } else {
            echo "<pre><code>";
            echo "<p>0 results</p>";
            echo "</code></pre>";
        }
    } else {
        echo "<p>Error executing Query : " . $conn->error . "</p>";
    }

    // Question 19
    $sql2 = "SELECT
AVG(TIMESTAMPDIFF(MINUTE, s.TimeWindow, ue.EndTime)) AS AvgSleepDurationinMinutes
FROM
Sleep s
JOIN
UserExercise ue ON s.UserExerciseID = ue.UserExerciseID
JOIN
Users u ON ue.UserID = u.UserID
WHERE
u.Gender = 'male'
AND TIMESTAMPDIFF(YEAR, u.Birthday, CURDATE()) BETWEEN 20 AND 30;"; 
    $result2 = $conn->query($sql2);
    //Headers and Query Block
    echo "<h2>Question 19: What is the average duration of sleep for male users aged between 20 and 30?</h2>";
    echo "<pre><code>";
    echo $sql2;
    echo "</pre></code>";
    // Output data of query 
    if ($result2) {
        if ($result2->num_rows > 0) {
            echo "<pre><code>";
            // Output table header
            echo "<table><tr>";
            while ($column = $result2->fetch_field()) {
                echo "<th>" . $column->name . "</th>";
            }
            echo "</tr>";

            // Output data rows
            while($row = $result2->fetch_assoc()) {
                echo "<tr>";
                foreach($row as $value) {
                    echo "<td>" . $value . "</td>";
                }
                echo "</tr>";
            }
            echo "</table></code></pre>";
        } else {
            echo "<pre><code>";
            echo "<p>0 results</p>";
            echo "</code></pre>";
        }
    } else {
        echo "<p>Error executing Query : " . $conn->error . "</p>";
    }

    // Question 20
    $sql2 = "SELECT COUNT(DISTINCT ue.UserExerciseID) AS NumberOfSessions
FROM UserExercise ue
INNER JOIN HeartRate hr ON ue.UserExerciseID = hr.UserExerciseID
WHERE hr.HeartRateValue > 85;"; 
    $result2 = $conn->query($sql2);
    //Headers and Query Block
    echo "<h2>Question 20: How many exercise sessions were logged with a heart rate exceeding 85 beats per minute?</h2>";
    echo "<pre><code>";
    echo $sql2;
    echo "</pre></code>";
    // Output data of query 
    if ($result2) {
        if ($result2->num_rows > 0) {
            echo "<pre><code>";
            // Output table header
            echo "<table><tr>";
            while ($column = $result2->fetch_field()) {
                echo "<th>" . $column->name . "</th>";
            }
            echo "</tr>";

            // Output data rows
            while($row = $result2->fetch_assoc()) {
                echo "<tr>";
                foreach($row as $value) {
                    echo "<td>" . $value . "</td>";
                }
                echo "</tr>";
            }
            echo "</table></code></pre>";
        } else {
            echo "<pre><code>";
            echo "<p>0 results</p>";
            echo "</code></pre>";
        }
    } else {
        echo "<p>Error executing Query : " . $conn->error . "</p>";
    }
    

    // Close connection
    $conn->close();
    ?>
</div>

</body>
</html>
