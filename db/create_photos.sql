DROP TABLE photos;
CREATE TABLE photos ( 
    id          	int AUTO_INCREMENT NOT NULL,
    store_id    	int NOT NULL,
    title    	    varchar(255) NULL,
    description     text,
    filename        varchar(255) NOT NULL,
    created_at  	datetime NULL,
    created_by  	int NULL,
    PRIMARY KEY(id)
);
