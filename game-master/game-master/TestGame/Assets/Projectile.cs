using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Projectile : MonoBehaviour
{
    public float speed = 20;    //speed of the projectile
    public Rigidbody2D rb;  //body of the projectile
    

    // Update is called once per frame
    void Start()
    {
        //setting the speed
        rb.AddForce(transform.right * speed, ForceMode2D.Force);
    }

    private void OnTriggerEnter2D(Collider2D collision)
    {
        //TODO make an enemy
        /*
        Enemy enemy = collision.GetComponent<Enemy>();
        if(enemy != null)
        {
            enemy.TakeDamage(damage);
        }
        */
        Debug.Log(collision.name);
        Destroy(gameObject);    //destroing the projectile
    }

    void Update()
    {
        //Destroys projectile after 20 seconds
        Destroy(this.gameObject, 20);
    }
}
