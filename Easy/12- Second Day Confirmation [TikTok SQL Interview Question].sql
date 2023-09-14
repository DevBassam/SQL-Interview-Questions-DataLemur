SELECT emails.user_id
FROM emails
INNER JOIN texts
ON emails.email_id = texts.email_id
WHERE signup_action = 'Confirmed'
  AND EXTRACT(day FROM action_date) = EXTRACT(DAY FROM signup_date) + 1
