/// @function HitPlayer(dir, damage, knockback)
/// @param {Real}	dir			Direction the attack hit from
/// @param {Real}	damage		Damages dealt
/// @param {Real}	knockback	Knockback force applied


function HitPlayer(_dir, _damage, _knockback)
{
	if (oPlayer.invulnerable <= 0 && global.playerHealth > 0)
	{
		// apply damage
		global.playerHealth = max(global.playerHealth-_damage, 0);

		// apply effects
		// health remaning
		with (oPlayer)
		{
			direction = _dir-180; // makes player face the enemy
			hitfrom = _dir;
			knockback = _knockback;
			ScreenShake(1, 10);
			if (global.playerHealth > 0)
			{
				flash = 4;
				playerState = PLAYER_STATE.HURT;
				invulnerable = global.invulnerabilityFrames;
			}
			else
			{
				flash = 1;
				playerState = PLAYER_STATE.DIE;
				other.enemyState = ENEMY_STATE.WANDER;
			}
		}
	}
}