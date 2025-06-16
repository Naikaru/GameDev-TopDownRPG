/// @description Inherit from oEnemy

// Inherit the parent event
event_inherited();

// Enemy Idle
enemyView[DOWN, ENEMY_STATE.IDLE] = sSlimeIdleDown;
enemyView[LEFT, ENEMY_STATE.IDLE] =	sSlimeIdleLeft;
enemyView[RIGHT,ENEMY_STATE.IDLE] = sSlimeIdleRight;
enemyView[UP,	ENEMY_STATE.IDLE] = sSlimeIdleUp;
// Enemy Wander
enemyView[DOWN, ENEMY_STATE.WANDER] = sSlimeMoveDown;
enemyView[LEFT, ENEMY_STATE.WANDER] = sSlimeMoveLeft;
enemyView[RIGHT,ENEMY_STATE.WANDER] = sSlimeMoveRight;
enemyView[UP,	ENEMY_STATE.WANDER] = sSlimeMoveUp;
// Enemy Move
enemyView[DOWN, ENEMY_STATE.CHASE] = sSlimeMoveDown;
enemyView[LEFT, ENEMY_STATE.CHASE] = sSlimeMoveLeft;
enemyView[RIGHT,ENEMY_STATE.CHASE] = sSlimeMoveRight;
enemyView[UP,	ENEMY_STATE.CHASE] = sSlimeMoveUp;
// Enemy Attack
enemyView[DOWN, ENEMY_STATE.ATTACK] = sSlimeAttackDown;
enemyView[LEFT, ENEMY_STATE.ATTACK] = sSlimeAttackLeft;
enemyView[RIGHT,ENEMY_STATE.ATTACK] = sSlimeAttackRight;
enemyView[UP,	ENEMY_STATE.ATTACK] = sSlimeAttackUp;


// init
enemyState = ENEMY_STATE.WANDER;
enemyStateNext = ENEMY_STATE.WANDER;
enemyStatePrev = ENEMY_STATE.WANDER;

// functions
function EnemyIdle()
{
	// Reset Idle state
	if (enemyState != enemyStatePrev)
	{
		enemyStatePrev = enemyState;
		nTicks= 0;
		hmove = 0;
		vmove = 0;
		sprite_index = enemyView[enemyDir, enemyState];
		image_index = 0;
	}
	
	// After Move Cooldown
	if (nTicks > moveCooldown)
	{
		enemyStatePrev = enemyState;
		enemyState = ENEMY_STATE.CHASE;
	}
	nTicks++;
}

function EnemyWander()
{
	if (enemyState != enemyStatePrev)
	{
		enemyStatePrev = enemyState;
		sprite_index = enemyView[enemyDir, enemyState];
	}
	
	if ((x == xTo) && (y == yTo)) || (time > enemyWanderDistance / enemySpeed)
	{
		// Reach destination or Given up (once an amount of time has passed safe check)
		hmove = 0;
		vmove = 0;
		// End move animation
		if (image_index < 1)
		{
			image_speed = 0.0;
			image_index = 0;
		}
		
		// Set new target animation
		if (++wait >= waitDuration)
		{
			wait = 0;
			time = 0;
			// wander around xstart, ystart
			dir = point_direction(x,y,xstart,ystart) + irandom_range(-enemyWanderDistance, enemyWanderDistance);
			xTo = x + lengthdir_x(enemyWanderDistance, dir);
			yTo = y + lengthdir_y(enemyWanderDistance, dir);
		}
	}
	else
	{
		// Move towards new destination
		time++;
		image_speed = 1.0;
		var _distTo = point_distance(x,y,xTo,yTo);
		var _speed = enemySpeed; // speed this frame
		if (_distTo < enemySpeed) // prevent overshoot on destination
			_speed = _distTo;
		dir = point_direction(x,y,xTo,yTo);
		hmove = lengthdir_x(_speed, dir);
		vmove = lengthdir_y(_speed, dir);
		enemyDir = GetDirection(hmove, vmove, enemyDir);
		sprite_index = enemyView[enemyDir, enemyState];

		// Move and Collide
		EnemyMoveCollide(hmove, vmove);
	}
	
	// check for player presence
	if (++aggroCheck >= aggroCheckDuration)
	{
		aggroCheck = 0;
		if (instance_exists(oPlayer) && point_in_circle(oPlayer.x, oPlayer.y, x, y, enemyAggroRadius))
		{
			enemyState = ENEMY_STATE.CHASE;
			target = oPlayer;
		}
	}
}

function EnemyChase()
{
	if (enemyState != enemyStatePrev)
	{
		// Start of the action
		enemyStatePrev = enemyState;
		sprite_index = enemyView[enemyDir, enemyState];
		image_index = 0;
	}
	
	if instance_exists(target)
	{
		xTo = target.x;
		yTo = target.y;
		image_speed = 1.0; // in case sprite speed has been changed
		dir = point_direction(x,y,xTo,yTo);
		var _distTo = point_distance(x,y,xTo,yTo);
		var _speed = enemySpeed; // speed this frame
		// prevent overshoot on destination
		if (_distTo < enemySpeed)
			_speed = _distTo;
		hmove = lengthdir_x(_speed, dir);
		vmove = lengthdir_y(_speed, dir);
		enemyDir = GetDirection(hmove, vmove, enemyDir);
		sprite_index = enemyView[enemyDir, enemyState];
	}
	EnemyMoveCollide(hmove, vmove);

	// check for player presence
	if (++aggroCheck >= aggroCheckDuration)
	{
		aggroCheck = 0;
		if (instance_exists(target) && point_in_circle(target.x, target.y, x, y, enemyAttackRadius))
		{
			enemyStateNext = ENEMY_STATE.ATTACK;
			enemyStateWaitDuration = 15;
			enemyState = ENEMY_STATE.WAIT;
		}
		else if (instance_exists(target) && !point_in_circle(target.x, target.y, x, y, enemyAggroRadius))
		{
			enemyState = ENEMY_STATE.WANDER;
		}
	}
}

function EnemyAttack()
{
	// Player in attack range
	if (enemyState != enemyStatePrev)
	{
		// Start of the action
		enemyStatePrev = enemyState;
		sprite_index = enemyView[enemyDir, enemyState];
		image_index = 0;
		image_speed = 1.0;
		if instance_exists(target)
		{
			dir = point_direction(x,y,target.x,target.y);
			// Aim slightly further (8px) than the target
			xTo = target.x + lengthdir_x(8, dir);
			yTo = target.y + lengthdir_y(8, dir);
		}
	}

	var _speed = enemySpeed;
	// wait until frame 3 to jump
	if (floor(image_index) < 2) { 
		_speed = 0; 
	}
	// freeze animation in mid-air until landing
	// 3 : frame enemy is mid-air
	// 6 : last frame ( 
	if (floor(image_index) == 3) || (image_index > image_number - 1) {
		image_speed = 0;
	}
	// dist to attack
	var _distTo = point_distance(x,y,xTo,yTo);

	// begin landing
	if (_distTo < 4) && (image_index < 6) {
		// restore image animation
		image_speed = 1;
	}

	// Move
	if (_distTo > _speed) {
		dir = point_direction(x,y,xTo,yTo);
		hmove = lengthdir_x(_speed, dir);
		vmove = lengthdir_y(_speed, dir);
		enemyDir = GetDirection(hmove, vmove, enemyDir);
		sprite_index = enemyView[enemyDir, enemyState];
		var _collision = EnemyMoveCollide(hmove, vmove);
		// on collision, commit to move and stop moving
		if (_collision)
		{
			xTo = x;
			yTo = y;
		}
	}
	else
	{
		x = xTo;
		y = yTo;
		hmove = 0;
		vmove = 0;
		if (image_index > image_number - 1)
		{
			enemyStateNext = ENEMY_STATE.CHASE;
			enemyStateWaitDuration = 15;
			enemyState = ENEMY_STATE.WAIT;
		}
	}
}

function EnemyHurt()
{
	sprite_index = sSlimeHurt;
	var _distTo = point_distance(x,y,xTo,yTo);
	if (_distTo > enemySpeed)
	{
		image_speed = 1.0;
		dir = point_direction(x,y,xTo,yTo);
		hmove = lengthdir_x(enemySpeed, dir);
		vmove = lengthdir_y(enemySpeed, dir);
		// update enemyDir
		enemyDir = GetDirection(hmove, vmove, enemyDir);

		// since we have only one frame sprite / oposite of the way we are moving
		if (hmove != 0) image_xscale = -sign(hmove);
		
		// move and collide
		if (EnemyMoveCollide(hmove, vmove))
		{
			xTo = x;
			yTo = y;
		}
	}
	else
	{
		x = xTo;
		y = yTo;
		image_xscale = 1;
		if (enemyStatePrev != ENEMY_STATE.ATTACK)
		{
			// attacking slime cancel its attack
			enemyState = enemyStatePrev;
		}
		else
		{
			// triggers aggro
			enemyState = ENEMY_STATE.CHASE;
		}
	}

}

function EnemyDie()
{
	if (enemyState != enemyStatePrev)
	{
		enemyStatePrev = enemyState;
		sprite_index = sSlimeDie;
		image_speed = 1.0;
		image_index = 0;
	}

	// apply remaining knockback
	var _distTo = point_distance(x,y,xTo,yTo);
	if (_distTo > enemySpeed)
	{
		dir = point_direction(x,y,xTo,yTo);
		hmove = lengthdir_x(enemySpeed, dir);
		vmove = lengthdir_y(enemySpeed, dir);
		// update enemyDir
		enemyDir = GetDirection(hmove, vmove, enemyDir);

		// since we have only one frame sprite
		if (hmove != 0) image_xscale = -sign(hmove);
		
		// move and collide
		EnemyMoveCollide(hmove, vmove);
	}
	else
	{
		x = xTo;
		y = yTo;
	}
	
	// on animation end
	if (image_index > image_number - 1)
		instance_destroy();
}