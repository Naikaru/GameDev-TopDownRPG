if (global.gamePaused)
{
	exit;
}

switch (enemyState)
{
	case ENEMY_STATE.IDLE:
	{
		EnemyIdle();
		break;
	}
	case ENEMY_STATE.WANDER:
	{
		EnemyWander();	
		break;
	}
	case ENEMY_STATE.CHASE:
	{
		EnemyChase();	
		break;
	}
	case ENEMY_STATE.ATTACK:
	{
		EnemyAttack();
		break;
	}
	case ENEMY_STATE.HURT:
	{
		EnemyHurt();	
		break;
	}
	case ENEMY_STATE.DIE:
	{
		EnemyDie();	
		break;
	}
	case ENEMY_STATE.WAIT:
	{
		EnemyWait();
		break;
	}
}