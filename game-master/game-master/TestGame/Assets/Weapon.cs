using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Weapon : MonoBehaviour
{
    public float fireRate = 0;
    public float damage = 5;
    public LayerMask toHit;
    public Transform ProjectilePrefab;
    

    float timeToFire = 0;
    float cooldown = 2;
    Transform firePoint;

    private void Awake()
    {
        //get the firepoint
        firePoint = transform.Find("FirePoint");
        if(firePoint == null)
        {
            Debug.Log("No FirePoint");
        }


    }

    // Update is called once per frame
    void Update()
    {
        
        
        //single shot
        if(fireRate == 0)
        {
            //cheking input and cooldown
            if (Input.GetButtonDown("Fire1") && Time.time > timeToFire)
            {
                
                Shoot();
                timeToFire = Time.time + cooldown;
            }
        }
        //automatic shooting
        else
        {
            //cheking input and cooldown
            if (Input.GetButton("Fire1") && Time.time > timeToFire)
            {
                Shoot();
                timeToFire = Time.time + 1 / fireRate;
            }
                    
        }
    }

    void Shoot()
    {
        Vector2 mousePosition = new Vector2(Camera.main.ScreenToWorldPoint(Input.mousePosition).x, Camera.main.ScreenToWorldPoint(Input.mousePosition).y);
        Vector2 firePointPosition = new Vector2(firePoint.position.x, firePoint.position.y);
        //TODO check if shooting backwards (check the angle)

        //TODO limit the amount of projectiles with fast weapons
        DrawProjectile(mousePosition, firePointPosition);
    }

    void DrawProjectile(Vector3 mousePosition, Vector3 firePointPosition)
    {
        Vector3 diff = mousePosition - firePointPosition;
        diff.Normalize();
        float rotZ = Mathf.Atan2(diff.y, diff.x) * Mathf.Rad2Deg;   //angle
        Instantiate(ProjectilePrefab, firePointPosition, Quaternion.Euler(0, 0, rotZ)); //instantiate the projectile
    }
}
