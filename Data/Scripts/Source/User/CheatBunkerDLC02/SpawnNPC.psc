Scriptname CheatBunkerDLC02:SpawnNPC extends CheatBunker:WorkshopNPCLogic

DLC02:DLC02WorkshopAttackStarterScript Property DLC02WorkshopAttackStarter Auto Const Mandatory
ActorBase Property TrapableActor Auto Const Mandatory

Actor Function spawnActor(ActorBase actorToSpawn, ObjectReference spawnLocation)
	Actor aSpawned = DLC02WorkshopAttackStarter.DLC02CageSpawnMarker.PlaceActorAtMe(getBaseActor(), 4, DLC02WorkshopAttackStarter.DLC02PlayerLevelZone) as Actor
	aSpawned.Disable()
	return aSpawned
EndFunction

Function postSpawnBehavior(Actor actorRef)
	actorRef.MoveTo(getSpawnLocation())
	actorRef.Enable()
	
	DLC02:DLC02TamedActorScript tamedActor = actorRef as DLC02:DLC02TamedActorScript
	if tamedActor && tamedActor.CheckForTame(getWorkshopRef())
		tamedActor.StopCombatAlarm()
	endif
EndFunction

Function addToSettlement(Actor actorRef)
{Not every trapable actor is a workshop NPC, so that needs to be checked prior to adding them.}
	WorkshopNPCScript workshopNPC = actorRef as WorkshopNPCScript
	if (workshopNPC)
		WorkshopParent.AddActorToWorkshop(workshopNPC, getWorkshopRef())
	endif
EndFunction

ActorBase Function getBaseActor()
	return TrapableActor
EndFunction
