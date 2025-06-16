/// @description Enemy Init

// Inherit the parent event
event_inherited();

// Enemy State
enum ENEMY_STATE
{
	IDLE,
	WANDER,
	CHASE,
	ATTACK,
	HURT,
	DIE,
	WAIT
}

// Variables
xTo = xstart;
yTo = ystart;
hmove = 0;
vmove = 0;
dir = 0;
enemyView = [];
aggroCheck = 0;
aggroCheckDuration = 5;		// check aggro every 5 frames
target = noone;

// Enemy State
enemyDir = DOWN;
enemyState = ENEMY_STATE.IDLE;
enemyStatePrev = enemyState;
enemyStateNext = enemyState;
enemyStateWait = 0;
enemyStateWaitDuration = 30;

// Enemy Stats
waitDuration = 60;
wait = 0;
time = 0;					// elapsed time


// Functions (must be overwritten)
function EnemyIdle() {}
function EnemyWander() {}
function EnemyChase() {}
function EnemyAttack() {}
function EnemyHurt() {}
function EnemyWait() 
{
	if (++enemyStateWait >= enemyStateWaitDuration)
	{
		enemyStateWait = 0;
		enemyState = enemyStateNext;
	}
}
function EnemyDie() { instance_destroy(); }
