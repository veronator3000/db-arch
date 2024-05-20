CREATE TABLE if not exists stream_viewers
(
    stream_id INTEGER REFERENCES streams (id),
    viewer_id INTEGER REFERENCES users (id),
    PRIMARY KEY (stream_id, viewer_id)
);
