SELECT r.car_id, r.car_name, car_size 
FROM mju_yongin_car c, mju_yongin_reservation r 
WHERE c.car_id = r.car_id 
