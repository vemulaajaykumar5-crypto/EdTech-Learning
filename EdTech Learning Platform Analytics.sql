#1: Dropout Distribution
SELECT
    dropout_risk,
    COUNT(*) AS students,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),2) AS percentage
FROM mydata.online
GROUP BY dropout_risk;
#2. Login Frequency Analysis

SELECT
    dropout_risk,
    AVG(login_frequency_per_week) AS avg_logins
FROM mydata.online
GROUP BY dropout_risk
ORDER BY avg_logins;

#3. Session Duration Analysis
Hypothesis

Engaged students spend more time learning.

SELECT
    dropout_risk,
    AVG(avg_session_minutes) AS avg_session
FROM mydata.online
GROUP BY dropout_risk;
#4. Course Progress Analysis

This is likely the strongest predictor.

SELECT
    dropout_risk,
    AVG(course_progress_percent) AS avg_progress
FROM mydata.online
GROUP BY dropout_risk;

#5. Assignment Analysis
SELECT
    dropout_risk,
    AVG(assignments_completed) AS avg_assignments
FROM mydata.online
GROUP BY dropout_risk;


#6. Quiz Performance
SELECT
    dropout_risk,
    AVG(quiz_average_score) AS avg_score
FROM mydata.online
GROUP BY dropout_risk;
#7. Forum Participation
    #Community Engagement
SELECT
    dropout_risk,
    AVG(forum_interactions) AS avg_forum_posts
FROM mydata.online
GROUP BY dropout_risk;

#8. Video Engagement
SELECT
    dropout_risk,
    AVG(video_watch_percent) AS avg_video_watch
FROM mydata.online
GROUP BY dropout_risk;

#9. Device Analysis
SELECT
    device_type,
    dropout_risk,
    COUNT(*) AS students
FROM mydata.online
GROUP BY device_type, dropout_risk
ORDER BY device_type;

#10. Course Category Analysis
SELECT
    course_category,
    dropout_risk,
    COUNT(*) AS students
FROM mydata.online
GROUP BY course_category, dropout_risk
ORDER BY course_category;

#11. Build an Engagement Score

     #This is something Product Analysts love.

SELECT
    student_id,
    (
      login_frequency_per_week +
      assignments_completed +
      forum_interactions
    ) AS engagement_score,
    dropout_risk
FROM mydata.online;