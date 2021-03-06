
/obj/machinery/overmap_vehicle/sabre
	name = "FS-250 Sabre"
	desc = "An early generation space capable interceptor."
	icon = 'code/modules/overmap/overmap_vehicles/icons/sabre.dmi'
	icon_state = "sabre"
	bound_width = 128
	bound_height = 128
	yaw_speed = 10
	accel_duration = 50
	sensor_icon_state = "sabre"
	iff_faction_broadcast = "UNSC"
	//nosegun_enabled = 1

/obj/machinery/overmap_vehicle/sabre/New()
	..()
	overmap_object.icon_state = "sabre"
	pixel_transform.icon_state_thrust = "Low thrust"

/obj/machinery/overmap_vehicle/sabre/health_update()
	//update damage overlays
	var/dmg_percent = 1 - (hull_remaining / hull_max)
	var/new_damage_state = 0
	if(dmg_percent >= 0.7)
		new_damage_state = 4
	else if(dmg_percent >= 0.5)
		new_damage_state = 3
	else if(dmg_percent >= 0.3)
		new_damage_state = 2
	else if(dmg_percent >= 0.1)
		new_damage_state = 1

	if(new_damage_state != damage_state)
		overlays -= damage_overlay
		if(new_damage_state)
			damage_overlay = new('code/modules/overmap/overmap_vehicles/icons/sabre.dmi', "dam[damage_state]")
			overlays += damage_overlay

		damage_state = new_damage_state

	//let the parent proc handle damage processing
	..()
