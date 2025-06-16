// States
enum PLAYER_STATE
{
	FREE,
	IDLE,
	WALK,
	RUN,
	JUMP,
	HURT,
	DIE,
	ACTION,
	LOCKED
}

// Actions
enum PLAYER_ACTION
{
	ATTACK,
	CHOP,
	DIG,
	RANGE_ATTACK
}

/// @function PlayerInit();
function PlayerInit()
{
	// Speed
	wlkSpeed = 0.8;
	runSpeed = 1.5;
	
	// Collision Map
	collisionMap = layer_tilemap_get_id(layer_get_id("Collisions"));

	// Mapping Direction / State
	// Idle
	playerView[DOWN, PLAYER_STATE.IDLE]		= sPlayerIdleDown;
	playerView[LEFT, PLAYER_STATE.IDLE]		= sPlayerIdleLeft;
	playerView[RIGHT, PLAYER_STATE.IDLE]	= sPlayerIdleRight;
	playerView[UP, PLAYER_STATE.IDLE]		= sPlayerIdleUp;
	// Walk
	playerView[DOWN, PLAYER_STATE.WALK]		= sPlayerWalkDown;
	playerView[LEFT, PLAYER_STATE.WALK]		= sPlayerWalkLeft;
	playerView[RIGHT, PLAYER_STATE.WALK]	= sPlayerWalkRight;
	playerView[UP, PLAYER_STATE.WALK]		= sPlayerWalkUp;
	// Run
	playerView[DOWN, PLAYER_STATE.RUN]		= sPlayerRunDown;
	playerView[LEFT, PLAYER_STATE.RUN]		= sPlayerRunLeft;
	playerView[RIGHT, PLAYER_STATE.RUN]		= sPlayerRunRight;
	playerView[UP, PLAYER_STATE.RUN]		= sPlayerRunUp;
	// Hurt
	playerView[DOWN, PLAYER_STATE.HURT]		= sPlayerHurtDown;
	playerView[LEFT, PLAYER_STATE.HURT]		= sPlayerHurtLeft;
	playerView[RIGHT, PLAYER_STATE.HURT]	= sPlayerHurtRight;
	playerView[UP, PLAYER_STATE.HURT]		= sPlayerHurtUp;

	// Actions Sprites
	// Attack
	playerActionView[DOWN, PLAYER_ACTION.ATTACK]	= sPlayerAttackDown;
	playerActionView[LEFT, PLAYER_ACTION.ATTACK]	= sPlayerAttackLeft;
	playerActionView[RIGHT, PLAYER_ACTION.ATTACK]	= sPlayerAttackRight;
	playerActionView[UP, PLAYER_ACTION.ATTACK]		= sPlayerAttackUp;
	// Chop
	playerActionView[DOWN, PLAYER_ACTION.CHOP]	= sPlayerChopDown;
	playerActionView[LEFT, PLAYER_ACTION.CHOP]	= sPlayerChopLeft;
	playerActionView[RIGHT, PLAYER_ACTION.CHOP] = sPlayerChopRight;
	playerActionView[UP, PLAYER_ACTION.CHOP]	= sPlayerChopUp;
	// Dig
	playerActionView[DOWN, PLAYER_ACTION.DIG]	= sPlayerDigDown;
	playerActionView[LEFT, PLAYER_ACTION.DIG]	= sPlayerDigLeft;
	playerActionView[RIGHT, PLAYER_ACTION.DIG]	= sPlayerDigRight;
	playerActionView[UP, PLAYER_ACTION.DIG]		= sPlayerDigUp;
	// Actions HitBox Masks
	// Attack
	playerActionHBMask[DOWN, PLAYER_ACTION.ATTACK]	= sPlayerAttackDownHB;
	playerActionHBMask[LEFT, PLAYER_ACTION.ATTACK]	= sPlayerAttackLeftHB;
	playerActionHBMask[RIGHT,PLAYER_ACTION.ATTACK]	= sPlayerAttackRightHB;
	playerActionHBMask[UP,	 PLAYER_ACTION.ATTACK]	= sPlayerAttackUpHB;
	// Chop
	playerActionHBMask[DOWN, PLAYER_ACTION.CHOP]	= sPlayerChopDownHB;
	playerActionHBMask[LEFT, PLAYER_ACTION.CHOP]	= sPlayerChopLeftHB;
	playerActionHBMask[RIGHT,PLAYER_ACTION.CHOP]	= sPlayerChopRightHB;
	playerActionHBMask[UP,	 PLAYER_ACTION.CHOP]	= sPlayerChopUpHB;
	// Dig
	playerActionHBMask[DOWN, PLAYER_ACTION.DIG]		= sPlayerDigDownHB;
	playerActionHBMask[LEFT, PLAYER_ACTION.DIG]		= sPlayerDigLeftHB;
	playerActionHBMask[RIGHT,PLAYER_ACTION.DIG]		= sPlayerDigRightHB;
	playerActionHBMask[UP,	 PLAYER_ACTION.DIG]		= sPlayerDigUpHB;

}